#!/usr/bin/env python

"""
Generate driver templates from song metadata, at build time.

Every song is ONE FILE, src/<book>/.../<song>.ly.tera: TOML front matter
inside a tera comment (the tune's metadata) followed by the LilyPond
parts as {% if part == "..." %} blocks. tera cannot include dynamic
paths, so each output (one per song, one per book) gets a generated
DRIVER template under out/drivers/ that renders the song file(s) several
times with `part` set. The tera processor picks the drivers up from
there (out/drivers is one of its src_dirs) and renders them into
out/tera/. Nothing generated is committed: rsconstruct runs this script
via the song_drivers generator (one driver per song, from the song's
derived metadata toml) and the per-book explicit products.

The drivers are produced by partially evaluating the weave master,
src/include/common.ly.weave. It still uses mako-style syntax (%-control
lines, ${...} interpolations, <%def> blocks), but it is processed
entirely by the DriverEmitter below; the mako package is not involved.
The LilyPond macro definitions live in src/include/common.ly.tera (a
regular committed source the drivers include), and the engraving
tonality in the TONALITY_* constants below.

Contracts:

    python -m scripts.drivers songs in.ly.toml out.ly.tera [...]
        rsconstruct generator contract, (input, output) pairs; the
        input is the song's derived metadata file, from which the song
        source path is recovered.

    python -m scripts.drivers book --inputs <weave+script+tomls...> \\
        --output-files out/drivers/out/tera/books/<book>.ly.tera
        rsconstruct explicit contract; the book is named by the output.

This is a descendant of scripts/convert_to_tera.py (deleted 2026-09-01
with the mako song tree it converted).
"""

import argparse
import json
import re
import sys
import tomllib
from dataclasses import dataclass
from pathlib import Path
from typing import Any

COMMON = Path("src/include/common.ly.weave")
SRC = Path("src")
DERIVED = Path("out/derived")
COMMON_TERA = SRC / "include/common.ly.tera"

# the engraving tonality: change these to transpose the whole corpus
TONALITY_PITCH = "c"
TONALITY_NAME = "C"

# the canonical ordering of song attributes (was scripts/attr.py's order)
ATTR_ORDER = [
    "doChords",
    "doVoice",
    "doLyrics",
    "doLyricsmore",
    "doLyricsmoremore",
    "doChordBars",
    "doGuitar",
    "doExtra",
    "doPrep",
    "doOwn",
    "render",
    "heb",
    "dedication",
    "title",
    "style",
    "subtitle",
    "subsubtitle",
    "composer",
    "poet",
    "piece",
    "singer",
    "arranger",
    "album",
    "opus",
    "instrument",
    "copyright",
    "copyrightextra",
    "copyrightextraextra",
    "typesetter",
    "completion",
    "dontimport",
    "uuid",
    "structure",
    "structureremark",
    "location",
    "remark",
    "idyoutuberemark1",
    "idyoutube1",
    "idyoutuberemark2",
    "idyoutube2",
    "idyoutuberemark3",
    "idyoutube3",
    "idyoutuberemark4",
    "idyoutube4",
    "idyoutuberemark5",
    "idyoutube5",
    "idyoutuberemark6",
    "idyoutube6",
    "lyricsurl",
    "wiki",
]

# shell commands reproducing the values the weave computed in python
SHELL_VARS = {
    "lilypond_version": 'lilypond --version 2>/dev/null | head -n 1 | cut -d " " -f 3',
    "date": "date +%d-%m-%Y",
    "year": "date +%Y",
    "gittag": "git describe --abbrev=0 --always",
    "gitdesc": "git describe --tags --always",
    "gitcommits": "git rev-list --count HEAD",
    "username": "whoami",
    "hostname": "hostname",
    "kernel": "uname -sr",
}
SINGLE_VARS = ["lilypond_version", "date"]
BOOK_VARS = list(SHELL_VARS)

GATTR_COMMON = {
    "inline": True,
    "space_after_tune": False,
    "break_after_tune": False,
    "break_after_toc": True,
    "lyricsInMidi": False,
    # set by the weave's defs block before any song renders; the study
    # songs read it from gattr inside their Vars part
    "copyrightvalstudy": "-- no copyright notice for study materials --",
}
GATTR_SINGLE = {**GATTR_COMMON, "book": False, "toc": False, "midi": True, "parts": False}
GATTR_BOOK = {**GATTR_COMMON, "book": True, "toc": True, "midi": False, "parts": True}

# The attribute-presence conditionals that stay live in the driver.
RUNTIME_HAS = {
    "dedication",
    "subtitle",
    "subsubtitle",
    "piece",
    "opus",
    "copyrightextra",
    "copyrightextraextra",
}

RE_CONTROL = re.compile(r"^%\s*(if|elif|else|endif|for|endfor)\b\s*(.*?):?\s*$")
RE_INCLUDE = re.compile(r"""<%include\s+file="/\$\{file\}"\s+args="part=([^"]+)"\s*/>""")
RE_ESCAPED_PCT = re.compile(r"^(\s*)%%")
RE_FRONT_MATTER = re.compile(r"\A(?:\{% import [^%]*%\})?\{#\n(.*?)\n#\}", re.DOTALL)


@dataclass
class SongMeta:
    """ one song as the driver generator sees it: the tera file plus metadata """
    tera_source: Path  # src/<book>/.../<song>.ly.tera
    attrs: dict[str, Any]
    versions: dict[str, dict[str, bool]]
    default_version: str

    @property
    def working_version(self) -> dict[str, bool]:
        """ the version the drivers render """
        return self.versions[self.default_version]

    @property
    def derived_toml(self) -> Path:
        """ the derived metadata file the driver loads at render time.

        Named <song>.ly.toml so it exactly matches what the rsconstruct
        derive_metadata generator produces from <song>.ly.tera at build
        time (a generator keeps the source's file_stem and swaps the
        extension) — the exact-path match is what orders derivation
        before the tera renders that load it.
        """
        rel = self.tera_source.relative_to(SRC)
        return DERIVED / rel.parent / (rel.name[: -len(".ly.tera")] + ".ly.toml")


def toml_str(value: str | bool | int) -> str:
    """ serialize one scalar as TOML (json escaping is TOML-compatible) """
    return json.dumps(value, ensure_ascii=False)


def compute_scratch(attrs: dict[str, Any]) -> dict[str, str]:
    """ replicate the scratch computations of the weave at generation time """
    heb = bool(attrs.get("heb"))
    computed = {}
    poet = attrs.get("poet")
    composer = attrs.get("composer")
    if composer is None:
        add = "" if poet is None else " / " + poet
    elif poet is None or composer == poet:
        add = " / " + composer
    else:
        add = " / " + composer + ", " + poet
    computed["tocname"] = attrs["title"] + add
    if "copyright" in attrs:
        if heb:
            computed["copyright"] = "זכויות יוצרים © " + attrs["copyright"]
        else:
            computed["copyright"] = "Copyright © " + attrs["copyright"]
    else:
        if heb:
            computed["copyright"] = "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --"
        else:
            computed["copyright"] = "-- help me fill it out this copyright notice --"
    if poet is not None and composer is not None and poet == composer:
        computed["fullcomposer"] = ("מילים ולחן: " if heb else "Lyrics and Music by ") + poet
        computed["fullpoet"] = ""
    else:
        if poet is None:
            computed["fullpoet"] = ""
        else:
            computed["fullpoet"] = ("מלים: " if heb else "Lyrics by ") + poet
        if composer is None:
            computed["fullcomposer"] = ""
        else:
            computed["fullcomposer"] = ("לחן: " if heb else "Music by ") + composer
    return computed


# ── the driver generator (partial evaluation of the weave) ───────────────


class DriverEmitter:
    """ partial evaluator turning the weave master into one output's driver """

    def __init__(self, gattr: dict, songs: list[SongMeta]):
        self.gattr = gattr
        self.songs = songs
        self.current = songs[0] if songs else None
        self.out: list[str] = []
        self.defs_body: str = ""
        self.clearvars_body: str = ""

    def song(self) -> SongMeta:
        """ the song whose loop iteration is being evaluated """
        assert self.current is not None
        return self.current

    # ── static condition evaluation ──────────────────────────────────────

    def eval_condition(self, cond: str) -> bool | str:
        """ evaluate a weave condition: bool if static, tera expr if runtime """
        match = re.fullmatch(r"gattr\['(\w+)'\](==False)?", cond)
        if match:
            val = bool(self.gattr[match.group(1)])
            return (not val) if match.group(2) else val
        match = re.fullmatch(r"attributes.get_working_version\(\)\['(\w+)'\](==False)?", cond)
        if match:
            val = bool(self.song().working_version[match.group(1)])
            return (not val) if match.group(2) else val
        match = re.fullmatch(r"'(\w+)'( not)? in attributes", cond)
        if match:
            key = match.group(1)
            if key in RUNTIME_HAS and not match.group(2):
                return f"meta.has.{key}"
            present = key in self.song().attrs
            return (not present) if match.group(2) else present
        match = re.fullmatch(r"'(\w+)' in attributes and attributes\['(\w+)'\]", cond)
        if match:
            attrs = self.song().attrs
            return match.group(1) in attrs and bool(attrs[match.group(1)])
        # the famous bare-name bug: `heb in attributes` compares mako's
        # UNDEFINED sentinel, so the condition is always False
        if re.fullmatch(r"heb in attributes and attributes\['heb'\]", cond):
            return False
        raise ValueError(f"unhandled condition in the weave: {cond}")

    # ── text transforms ──────────────────────────────────────────────────

    def substitute(self, line: str) -> str:
        """ apply %% un-escaping, ${} mapping and include splicing to a text line """
        line = RE_ESCAPED_PCT.sub(r"\1%", line)
        line = RE_INCLUDE.sub(lambda m: self.splice_part(m.group(1)), line)
        replacements = {
            "${gattr['lilypond_version']}": "{{ lilypond_version }}",
            "${gattr['date']}": "{{ date }}",
            "${gattr['year']}": "{{ year }}",
            "${gattr['gittag']}": "{{ gittag }}",
            "${gattr['gitdesc']}": "{{ gitdesc }}",
            "${gattr['gitcommits']}": "{{ gitcommits }}",
            "${gattr['username']}": "{{ username }}",
            "${gattr['hostname']}": "{{ hostname }}",
            "${gattr['kernel']}": "{{ kernel }}",
            "${TONALITYTransposePitch}": TONALITY_PITCH,
            "${TONALITYName}": TONALITY_NAME,
            "${len(gattr['files'])}": str(len(self.songs)),
            "${scratch['tocname']}": "{{ meta.computed.tocname }}",
            "${scratch['copyright']}": "{{ meta.computed.copyright }}",
            "${scratch['fullpoet']}": "{{ meta.computed.fullpoet }}",
            "${scratch['fullcomposer']}": "{{ meta.computed.fullcomposer }}",
            "${scratch['typesetby']}": "Typeset by {{ meta.attributes.typesetter }}",
            "${scratch['tagline']}": (
                "Typeset by {{ meta.attributes.typesetter }}, Built at {{ date }},"
                " Engraved by lilypond {{ lilypond_version }}"
            ),
        }
        for old, new in replacements.items():
            line = line.replace(old, new)
        line = re.sub(r"\$\{attributes\['(\w+)'\]\}", r"{{ meta.attributes.\1 }}", line)
        if "${" in line:
            raise ValueError(f"unhandled interpolation: {line!r}")
        # a LilyPond '{' glued to a spliced tag reads as '{{' to tera; insert
        # a space and let the left-trim marker remove it from the output
        return line.replace("{{%", "{ {%-")

    def splice_part(self, part_expr: str) -> str:
        """ render one part of the current song, as mako's include did """
        if part_expr.startswith("'"):
            part = part_expr.strip("'")
        else:  # e.g. part=Chords where Chords='Chords'+default version name
            part = part_expr + self.song().default_version
        return (
            '{% set part = "' + part + '" %}'
            '{% include "' + self.song().tera_source.as_posix() + '" %}'
        )

    # ── the evaluator ────────────────────────────────────────────────────

    def emit(self, text: str) -> None:
        """ append text to the driver """
        self.out.append(text)

    def run(self, common_text: str) -> str:
        """ evaluate the weave, return the driver template text """
        self.eval_lines(common_text.splitlines(keepends=True))
        return "".join(self.out)

    def eval_lines(self, lines: list[str]) -> None:  # pylint: disable=too-many-branches
        """ evaluate a run of weave template lines """
        # frames: ("static", taking, seen_true) or ("runtime",)
        stack: list[tuple] = []
        index = 0

        def taking() -> bool:
            return all(f[0] == "runtime" or f[1] for f in stack)

        while index < len(lines):
            line = lines[index]
            stripped = line.strip()
            control = RE_CONTROL.match(line)
            if control and control.group(1) == "for" and taking():
                index += 1 + self.unroll_loop(lines[index + 1:])
                continue
            if control:
                self.handle_control(control, stack, taking())
                index += 1
                continue
            if stripped == "<%":  # code block: consumed, newline after %> kept
                while lines[index].strip() != "%>":
                    index += 1
                index += 1
                if taking():
                    self.emit("\n")
                continue
            if stripped.startswith("<%doc>"):
                while "</%doc>" not in lines[index]:
                    index += 1
                index += 1
                if taking():
                    self.emit("\n")
                continue
            if stripped.startswith("<%def"):
                name = re.search(r'name="(\w+)\(\)"', line).group(1)  # type: ignore[union-attr]
                body: list[str] = []
                index += 1
                while "</%def>" not in lines[index]:
                    body.append(lines[index])
                    index += 1
                index += 1
                # the def body starts with the newline ending the <%def> tag line
                self.store_def(name, "\n" + "".join(body))
                if taking():
                    self.emit("\n")
                continue
            index += 1
            if not taking():
                continue
            if "${self.defs()}" in line:
                self.emit('{% include "' + COMMON_TERA.as_posix() + '" %}\n')
                continue
            if "${self.clearVars()}" in line:
                self.emit(self.eval_def_body(self.clearvars_body) + "\n")
                continue
            self.emit(self.substitute(line))

    def unroll_loop(self, rest: list[str]) -> int:
        """ evaluate the per-song loop body once per song; returns body length """
        depth = 0
        for end, line in enumerate(rest):
            control = RE_CONTROL.match(line)
            if control and control.group(1) == "for":
                depth += 1
            elif control and control.group(1) == "endfor":
                if depth == 0:
                    body = rest[:end]
                    for song in self.songs:
                        self.current = song
                        self.emit('{% set meta = load_toml(path="' + song.derived_toml.as_posix() + '") %}')
                        self.eval_lines(body)
                    return end + 1
                depth -= 1
        raise ValueError("unterminated % for loop in the weave")

    def handle_control(self, control: re.Match, stack: list[tuple], was_taking: bool) -> None:
        """ process one %-control line """
        keyword, cond = control.group(1), control.group(2)
        if keyword in ("if", "for"):
            if not was_taking:
                stack.append(("static", False, True))  # dead branch, swallow nesting
            else:
                value = self.eval_condition(cond)  # a live 'for' never reaches here
                if isinstance(value, str):
                    self.emit("{% if " + value + " %}")
                    stack.append(("runtime",))
                else:
                    stack.append(("static", value, value))
        elif keyword == "else":
            frame = stack[-1]
            if frame[0] == "runtime":
                self.emit("{% else %}")
            else:
                stack[-1] = ("static", not frame[2], True)
        elif keyword in ("endif", "endfor"):
            frame = stack.pop()
            if frame[0] == "runtime":
                self.emit("{% endif %}")

    def store_def(self, name: str, body: str) -> None:
        """ remember a <%def> body for later expansion """
        if name == "defs":
            self.defs_body = body
        elif name == "clearVars":
            self.clearvars_body = body
        else:
            raise ValueError(f"unexpected def in the weave: {name}")

    def eval_def_body(self, body: str) -> str:
        """ partial-evaluate a def body with the same line semantics """
        inner = DriverEmitter(self.gattr, [self.current] if self.current else [])
        return inner.run(body)


# ── song metadata ────────────────────────────────────────────────────────


def parse_song_meta(tera_path: Path) -> SongMeta:
    """ read one tera song file's front matter """
    match = RE_FRONT_MATTER.match(tera_path.read_text(encoding="utf-8"))
    if not match:
        raise ValueError(f"no front matter in {tera_path}")
    data = tomllib.loads(match.group(1))
    return SongMeta(
        tera_source=tera_path,
        attrs=data["attributes"],
        versions=data["versions"],
        default_version=data["default_version"],
    )


def derived_content(meta: SongMeta) -> str:
    """ the derived metadata the driver loads at render time """
    lines = ["# derived from the song's front matter, do not edit\n"]
    lines.append("\n[attributes]\n")
    for key in ATTR_ORDER:
        if key in meta.attrs:
            lines.append(f"{key} = {toml_str(meta.attrs[key])}\n")
    lines.append("\n[has]\n")
    for key in ATTR_ORDER:
        lines.append(f"{key} = {toml_str(key in meta.attrs)}\n")
    lines.append("\n[computed]\n")
    for key, val in compute_scratch(meta.attrs).items():
        lines.append(f"{key} = {toml_str(val)}\n")
    return "".join(lines)


# ── driver generation ────────────────────────────────────────────────────


def driver_header(var_names: list[str]) -> str:
    """ the glued {% set %} preamble providing shell-derived values """
    parts = []
    for name in var_names:
        command = SHELL_VARS[name]
        quote = "'" if '"' in command else '"'  # tera strings have no escapes
        if quote in command:
            raise ValueError(f"cannot quote shell command for tera: {command}")
        parts.append("{% set " + name + " = shell_output(command=" + quote + command + quote + ", depends_on=[]) %}")
    return "".join(parts)


def write_driver(gattr: dict, songs: list[SongMeta], var_names: list[str], driver: Path) -> None:
    """ generate one driver template by partial evaluation of the weave """
    emitter = DriverEmitter(gattr, songs)
    body = emitter.run(COMMON.read_text(encoding="utf-8"))
    driver.parent.mkdir(parents=True, exist_ok=True)
    driver.write_text(driver_header(var_names) + body, encoding="utf-8")


def toml_to_song(toml_path: Path) -> Path:
    """ recover the song source path from its derived metadata path """
    rel = toml_path.relative_to(DERIVED)
    return SRC / rel.parent / (rel.name[: -len(".ly.toml")] + ".ly.tera")


def cmd_songs(args: list[str]) -> int:
    """ generator contract: (derived toml, driver) pairs """
    if not args or len(args) % 2 != 0:
        print(f"usage: {sys.argv[0]} songs input output [input output ...]", file=sys.stderr)
        return 1
    for source, output in zip(args[::2], args[1::2]):
        meta = parse_song_meta(toml_to_song(Path(source)))
        write_driver(GATTR_SINGLE, [meta], SINGLE_VARS, Path(output))
    return 0


def cmd_book(args: list[str]) -> int:
    """ explicit contract: --inputs weave+script+tomls --output-files driver """
    parser = argparse.ArgumentParser()
    parser.add_argument("--inputs", nargs="+", required=True)
    parser.add_argument("--output-files", nargs="+", required=True, dest="output_files")
    parsed = parser.parse_args(args)
    if len(parsed.output_files) != 1:
        raise ValueError(f"expected exactly one driver output, got {parsed.output_files}")
    tomls = [Path(p) for p in parsed.inputs if p.endswith(".ly.toml")]
    # the canonical book order (the order the old Makefile+wrapper sorted by)
    songs = sorted(
        (toml_to_song(p) for p in tomls),
        key=lambda p: "src/" + str(p.relative_to(SRC)),
    )
    metas = [parse_song_meta(p) for p in songs]
    write_driver(GATTR_BOOK, metas, BOOK_VARS, Path(parsed.output_files[0]))
    return 0


def main() -> int:
    """ main entry point """
    if len(sys.argv) < 2 or sys.argv[1] not in ("songs", "book"):
        print(f"usage: {sys.argv[0]} songs|book ...", file=sys.stderr)
        return 1
    if sys.argv[1] == "songs":
        return cmd_songs(sys.argv[2:])
    return cmd_book(sys.argv[2:])


if __name__ == "__main__":
    sys.exit(main())
