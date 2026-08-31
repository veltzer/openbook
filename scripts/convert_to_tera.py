"""
Convert the mako song corpus to tera, side by side with the mako pipeline.

The layout follows the same decisions as the mako system: EVERY SONG IS
ONE FILE carrying its metadata and all of its variations. A song's
src.tera/<book>/.../<song>.ly.tera holds TOML front matter inside a tera
comment (the metadata that was python in the mako 'Vars' part) followed
by the LilyPond parts as {% if part == "..." %} blocks, with local chord
defs as same-file macros — a 1:1 translation of the mako file.

The render-time machinery mirrors the old wrapper+common.ly.mako pair:
generated driver templates (tera cannot include dynamic paths, so the
per-output weave of common.ly.mako is partially evaluated per tune and
per book) render each song file several times with `part` set, exactly
as common.ly.mako included each song per part.

Subcommands:
  golden   render every single tune and every book through the mako
           pipeline into out/golden/, the byte-exact reference
  convert  mako sources -> one-file tera songs in src.tera/ (plus the
           shared include/ translations), then run `drivers`
  drivers  tera song files -> driver templates under
           tera.templates/out/tera/ and derived metadata under
           out/derived/ (reads only src.tera, never the mako sources)
  compare  byte-diff out/tera against out/golden

Whitespace follows mako's exact semantics (consumed control lines, kept
newline after block tags, leading %% un-escaped to %), so the tera
output is byte-identical to mako's.
"""

import argparse
import json
import re
import sys
import tomllib
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import mako.lookup
import mako.template

from scripts import attr

COMMON = Path("include/common.ly.mako")
NAMESPACE_DEFS = Path("include/defs.ly.mako")
SRC = Path("src")
SRC_TERA = Path("src.tera")
DRIVERS = Path("tera.templates/out/tera/src")
BOOK_DRIVERS = Path("tera.templates/out/tera/books")
GOLDEN = Path("out/golden")
TERA_OUT = Path("out/tera")
DERIVED = Path("out/derived")
COMMON_TERA = SRC_TERA / "include/common.ly.tera"
DEFS_TERA = SRC_TERA / "include/defs.ly.tera"

BOOKS = ["openbook", "israeli", "drumming", "rockbook", "guitar_album"]

# shell commands reproducing the values common.ly.mako computes in python
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
    # set by common.ly.mako's defs block before any song renders; the study
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
RE_PART_IF = re.compile(r"^%\s*if part\s*==\s*'(\w+)'\s*:\s*$")
RE_FRONT_MATTER = re.compile(r"\A(?:\{% import [^%]*%\})?\{#\n(.*?)\n#\}", re.DOTALL)


@dataclass
class SongMeta:
    """ one song as the driver generator sees it: the tera file plus metadata """
    tera_source: Path  # src.tera/<book>/.../<song>.ly.tera
    attrs: dict[str, Any]
    versions: dict[str, dict[str, bool]]
    default_version: str

    @property
    def working_version(self) -> dict[str, bool]:
        """ the version the drivers render """
        return self.versions[self.default_version]

    @property
    def derived_toml(self) -> Path:
        """ the derived metadata file the driver loads at render time """
        rel = self.tera_source.relative_to(SRC_TERA)
        return DERIVED / rel.parent / (rel.name[: -len(".ly.tera")] + ".toml")


def lookup() -> mako.lookup.TemplateLookup:
    """ template lookup rooted at the repository, as the wrapper uses """
    return mako.lookup.TemplateLookup(directories=["."], input_encoding="utf-8")


def capture_vars(song: Path) -> attr.Attributes:
    """ execute the song's Vars part and return the filled Attributes """
    attributes = attr.Attributes()
    attributes.reset()
    template = mako.template.Template(filename=str(song), lookup=lookup(), input_encoding="utf-8")
    template.render(part="Vars", attributes=attributes, gattr=dict(GATTR_SINGLE), scratch={})
    return attributes


def toml_str(value: str | bool | int) -> str:
    """ serialize one scalar as TOML (json escaping is TOML-compatible) """
    return json.dumps(value, ensure_ascii=False)


def compute_scratch(attrs: dict[str, Any]) -> dict[str, str]:
    """ replicate the scratch computations of common.ly.mako at convert time """
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


# ── mako song -> one-file tera song ──────────────────────────────────────


def front_matter(attributes: attr.Attributes) -> str:
    """ the song's metadata as TOML, the front matter of its tera file """
    lines = [f"default_version = {toml_str(attributes.get_default_version_name())}\n"]
    lines.append("\n[attributes]\n")
    for key in attr.order:
        if key in attributes:
            lines.append(f"{key} = {toml_str(attributes[key])}\n")
    for name, version in attributes.versions.items():
        lines.append(f"\n[versions.{name}]\n")
        for key, val in version.items():
            lines.append(f"{key} = {toml_str(val)}\n")
    text = "".join(lines)
    if "#}" in text:
        raise ValueError("metadata cannot be embedded in a tera comment: contains #}")
    return text


def translate_text(line: str) -> str:
    """ translate one literal mako line to its tera equivalent """
    line = RE_ESCAPED_PCT.sub(r"\1%", line)
    line = line.replace("${chords()}", "{{ self::chords() }}")
    line = line.replace("${defs.chordDefs()}", "{{ defs::chordDefs() }}")
    if "${" in line or "{{{" in line or "{{%" in line or "{#" in line:
        raise ValueError(f"untranslatable song line: {line!r}")
    return line


def logical_lines(text: str) -> list[str]:
    """ mako's trailing-backslash continuation: the backslash is dropped and
    the next physical line (leading %% un-escaped, as mako does per physical
    line) is glued on. The first line keeps its raw %% for translate_text. """
    joined: list[str] = []
    for line in text.splitlines(keepends=True):
        if joined and joined[-1].endswith("\\\n"):
            joined[-1] = joined[-1][:-2] + RE_ESCAPED_PCT.sub(r"\1%", line)
        else:
            joined.append(line)
    return joined


def translate_song_body(text: str) -> tuple[str, str]:
    """ translate a mako song's template body to tera, whitespace-exact

    tera requires {% import %} before any content, so the mako namespace
    line is hoisted to the very top (returned as prefix) and leaves its
    newline in place.
    """
    prefix = ""
    if "<%namespace" in text:
        prefix = '{% import "' + DEFS_TERA.as_posix() + '" as defs %}'
    lines = logical_lines(text)
    out: list[str] = []
    index = 0
    while index < len(lines):
        line = lines[index]
        stripped = line.strip()
        part_if = RE_PART_IF.match(line)
        if part_if:
            out.append('{% if part == "' + part_if.group(1) + '" %}')
            index += 1
        elif re.match(r"^%\s*endif", line):
            out.append("{% endif %}")
            index += 1
        elif stripped.startswith("<%page"):
            out.append("\n")
            index += 1
        elif stripped.startswith("<%namespace"):
            out.append("\n")  # the import itself is hoisted to the top of the file
            index += 1
        elif stripped == "<%":  # metadata code block: emits its trailing newline
            while lines[index].strip() != "%>":
                index += 1
            index += 1
            out.append("\n")
        elif stripped.startswith("<%def"):
            name = re.search(r'name="(\w+)\(\)"', line).group(1)  # type: ignore[union-attr]
            out.append("{% macro " + name + "() %}\n")
            index += 1
            while "</%def>" not in lines[index]:
                out.append(translate_text(lines[index]))
                index += 1
            index += 1
            out.append("{% endmacro %}\n")
        elif stripped.startswith("%") and not stripped.startswith("%%"):
            raise ValueError(f"unhandled mako control line in song: {line!r}")
        else:
            out.append(translate_text(line))
            index += 1
    return prefix, "".join(out)


def convert_song(song: Path) -> Path:
    """ convert one mako song to its single tera file; returns the new path """
    rel = song.relative_to(SRC)
    attributes = capture_vars(song)
    tera_path = SRC_TERA / rel.parent / (rel.name[: -len(".ly.mako")] + ".ly.tera")
    tera_path.parent.mkdir(parents=True, exist_ok=True)
    prefix, body = translate_song_body(song.read_text(encoding="utf-8"))
    # the import must be first and trims ALL whitespace after it; the glued
    # front-matter comment shields the body from that trim
    text = prefix + "{#\n" + front_matter(attributes) + "#}" + body
    tera_path.write_text(text, encoding="utf-8")
    return tera_path


def write_shared_includes() -> None:
    """ translate include/defs.ly.mako and common.ly.mako's defs() block """
    DEFS_TERA.parent.mkdir(parents=True, exist_ok=True)
    _, defs_body = translate_song_body(NAMESPACE_DEFS.read_text(encoding="utf-8"))
    DEFS_TERA.write_text(defs_body, encoding="utf-8")
    harvester = DriverEmitter(GATTR_SINGLE, [])
    harvester.run(COMMON.read_text(encoding="utf-8"))
    COMMON_TERA.write_text(harvester.eval_def_body(harvester.defs_body), encoding="utf-8")


# ── the driver generator (partial evaluation of common.ly.mako) ──────────


class DriverEmitter:
    """ partial evaluator turning common.ly.mako into one output's driver """

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
        """ evaluate a mako condition: bool if static, tera expr if runtime """
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
        raise ValueError(f"unhandled condition in common.ly.mako: {cond}")

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
            "${TONALITYTransposePitch}": "c",
            "${TONALITYName}": "C",
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
        """ evaluate common.ly.mako, return the driver template text """
        self.eval_lines(common_text.splitlines(keepends=True))
        return "".join(self.out)

    def eval_lines(self, lines: list[str]) -> None:  # pylint: disable=too-many-branches
        """ evaluate a run of mako template lines """
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
        raise ValueError("unterminated % for loop in common.ly.mako")

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
            raise ValueError(f"unexpected def in common.ly.mako: {name}")

    def eval_def_body(self, body: str) -> str:
        """ partial-evaluate a def body with the same line semantics """
        inner = DriverEmitter(self.gattr, [self.current] if self.current else [])
        return inner.run(body)


# ── the drivers step: tera song files -> drivers + derived metadata ──────


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


def write_derived_toml(meta: SongMeta) -> None:
    """ write the derived metadata file the driver loads at render time """
    lines = ["# derived from the song's front matter by scripts/convert_to_tera.py\n"]
    lines.append("\n[attributes]\n")
    for key in attr.order:
        if key in meta.attrs:
            lines.append(f"{key} = {toml_str(meta.attrs[key])}\n")
    lines.append("\n[has]\n")
    for key in attr.order:
        lines.append(f"{key} = {toml_str(key in meta.attrs)}\n")
    lines.append("\n[computed]\n")
    for key, val in compute_scratch(meta.attrs).items():
        lines.append(f"{key} = {toml_str(val)}\n")
    meta.derived_toml.parent.mkdir(parents=True, exist_ok=True)
    meta.derived_toml.write_text("".join(lines), encoding="utf-8")


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
    """ generate one driver template by partial evaluation of common.ly.mako """
    emitter = DriverEmitter(gattr, songs)
    body = emitter.run(COMMON.read_text(encoding="utf-8"))
    driver.parent.mkdir(parents=True, exist_ok=True)
    driver.write_text(driver_header(var_names) + body, encoding="utf-8")


def tera_song_paths() -> list[Path]:
    """ all one-file tera songs, in the order the Makefile+wrapper sorts them """
    paths = [p for p in SRC_TERA.rglob("*.ly.tera") if not p.is_relative_to(SRC_TERA / "include")]
    return sorted(paths, key=lambda p: "src/" + str(p.relative_to(SRC_TERA)))


def cmd_drivers() -> int:
    """ generate drivers and derived metadata from the tera song files """
    metas = {path: parse_song_meta(path) for path in tera_song_paths()}
    for path, meta in metas.items():
        write_derived_toml(meta)
        rel = path.relative_to(SRC_TERA)
        driver = DRIVERS / rel.parent / (rel.name[: -len(".ly.tera")] + ".ly.tera")
        write_driver(GATTR_SINGLE, [meta], SINGLE_VARS, driver)
    for book in BOOKS:
        songs = [m for p, m in metas.items() if p.is_relative_to(SRC_TERA / book)]
        write_driver(GATTR_BOOK, songs, BOOK_VARS, BOOK_DRIVERS / f"{book}.ly.tera")
    print(f"drivers: {len(metas)} songs and {len(BOOKS)} books")
    return 0


# ── golden / convert / compare ───────────────────────────────────────────


def song_paths() -> list[Path]:
    """ all mako song templates, stable order """
    return sorted(SRC.rglob("*.ly.mako"))


def book_songs(book: str) -> list[Path]:
    """ the mako songs of one book, in the order the Makefile+wrapper renders them """
    return sorted((SRC / book).rglob("*.ly.mako"), key=str)


def golden_render(gattr_base: dict, files: list[Path]) -> bytes:
    """ render one output through the mako pipeline as wrapper_mako does """
    import config.openbook  # pylint: disable=import-outside-toplevel
    gattr = dict(gattr_base)
    gattr["files"] = [str(f) for f in files]
    gattr["lilypond_version"] = config.openbook.lilypond_version
    template = mako.template.Template(
        filename=str(COMMON), lookup=lookup(), input_encoding="utf-8", output_encoding="utf-8",
    )
    attributes = attr.Attributes()
    return template.render(attributes=attributes, gattr=gattr, scratch={})


def cmd_golden() -> int:
    """ build the golden corpus: every single tune plus every book """
    count = 0
    for song in song_paths():
        out = GOLDEN / song.relative_to(SRC.parent).with_suffix("").with_suffix(".ly")
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_bytes(golden_render(GATTR_SINGLE, [song]))
        count += 1
    for book in BOOKS:
        out = GOLDEN / "books" / f"{book}.ly"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_bytes(golden_render(GATTR_BOOK, book_songs(book)))
    print(f"golden: rendered {count} songs and {len(BOOKS)} books into {GOLDEN}")
    return 0


def cmd_convert() -> int:
    """ convert the mako corpus to one-file tera songs, then run `drivers` """
    stale = [p for p in SRC_TERA.rglob("*") if p.is_file()]
    for path in stale:
        path.unlink()
    failures = []
    count = 0
    for song in song_paths():
        try:
            convert_song(song)
            count += 1
        except Exception as exc:  # noqa: BLE001  # pylint: disable=broad-exception-caught
            failures.append((song, exc))
    write_shared_includes()
    print(f"convert: {count} songs converted, {len(failures)} failed")
    for failed_song, failure in failures:
        print(f"  FAIL {failed_song}: {failure}")
    if failures:
        return 1
    return cmd_drivers()


def cmd_compare() -> int:
    """ compare tera output against the golden corpus """
    same, differ, missing = [], [], []
    for gold in sorted(GOLDEN.rglob("*.ly")):
        candidate = TERA_OUT / gold.relative_to(GOLDEN)
        if not candidate.is_file():
            missing.append(candidate)
        elif candidate.read_bytes() == gold.read_bytes():
            same.append(candidate)
        else:
            differ.append(candidate)
    print(f"compare: {len(same)} identical, {len(differ)} differ, {len(missing)} missing")
    for path in differ[:10]:
        print(f"  DIFFER {path}")
    for path in missing[:10]:
        print(f"  MISSING {path}")
    return 0 if not differ and not missing else 1


def main() -> int:
    """ main entry point """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["golden", "convert", "drivers", "compare"])
    args = parser.parse_args()
    commands = {
        "golden": cmd_golden,
        "convert": cmd_convert,
        "drivers": cmd_drivers,
        "compare": cmd_compare,
    }
    return commands[args.command]()


if __name__ == "__main__":
    sys.exit(main())
