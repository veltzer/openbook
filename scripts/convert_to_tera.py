"""
Convert the mako song corpus to tera, side by side with the mako pipeline.

The mako pipeline renders include/common.ly.mako once per output with a
gattr dict steering it (single tune vs whole book) and each song supplying
a 'Vars' part (python filling an Attributes object) plus LilyPond parts.

This tool performs the data/markup separation for the single-tune outputs:

  golden   render every song through the mako pipeline into out/golden/,
           the byte-exact reference the tera side must reproduce
  convert  for every song, write
             src.tera/<book>/.../<song>.toml           extracted metadata
             src.tera/<book>/.../<song>.<Part>.ly.tera extracted parts
             tera.templates/out/tera/src/.../<song>.ly.tera  driver
           plus the shared src.tera/include/defs.ly.tera
  compare  byte-diff out/tera/src against out/golden/src

The driver is produced by partially evaluating common.ly.mako: gattr
conditionals and version flags are baked at convert time, while metadata
values and attribute-presence conditionals stay live tera expressions
reading the song's TOML. Whitespace follows mako's exact semantics
(consumed control lines, kept newline after block tags, leading %%
un-escaped to %), so the tera output can be byte-identical to mako's.
"""

import argparse
import json
import re
import sys
from pathlib import Path

import mako.lookup
import mako.template

from scripts import attr

COMMON = Path("include/common.ly.mako")
SRC = Path("src")
SRC_TERA = Path("src.tera")
DRIVERS = Path("tera.templates/out/tera/src")
GOLDEN = Path("out/golden/src")
DEFS_TERA = SRC_TERA / "include/defs.ly.tera"

LILYPOND_VERSION_CMD = 'lilypond --version 2>/dev/null | head -n 1 | cut -d " " -f 3'
DATE_CMD = "date +%d-%m-%Y"

# gattr for a single-tune render, as scripts/wrapper_mako.py builds it
# (book mode is not converted yet). date/lilypond_version stay symbolic.
GATTR_SINGLE = {
    "book": False,
    "toc": False,
    "midi": True,
    "parts": False,
    "inline": True,
    "space_after_tune": False,
    "break_after_tune": False,
    "break_after_toc": True,
    "lyricsInMidi": False,
    # set by common.ly.mako's defs block before any song renders; the study
    # songs read it from gattr inside their Vars part
    "copyrightvalstudy": "-- no copyright notice for study materials --",
}

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


def lookup() -> mako.lookup.TemplateLookup:
    """ template lookup rooted at the repository, as the wrapper uses """
    return mako.lookup.TemplateLookup(directories=["."], input_encoding="utf-8")


def render_song_part(song: Path, part: str, attributes: attr.Attributes) -> str:
    """ render one song template with one part selected, mako-exact """
    template = mako.template.Template(filename=str(song), lookup=lookup(), input_encoding="utf-8")
    return template.render(part=part, attributes=attributes, gattr=dict(GATTR_SINGLE), scratch={})


def capture_vars(song: Path) -> attr.Attributes:
    """ execute the song's Vars part and return the filled Attributes """
    attributes = attr.Attributes()
    attributes.reset()
    render_song_part(song, "Vars", attributes)
    return attributes


def toml_str(value: str | bool | int) -> str:
    """ serialize one scalar as TOML (json escaping is TOML-compatible) """
    return json.dumps(value, ensure_ascii=False)


def compute_scratch(attributes: attr.Attributes) -> dict[str, str]:
    """ replicate the scratch computations of common.ly.mako at convert time """
    heb = bool(attributes.get("heb"))
    computed = {}
    if "copyright" in attributes:
        if heb:
            computed["copyright"] = "זכויות יוצרים © " + attributes["copyright"]
        else:
            computed["copyright"] = "Copyright © " + attributes["copyright"]
    else:
        if heb:
            computed["copyright"] = "-- עיזרו לי למלא את שורת זכויות היוצרים הזו --"
        else:
            computed["copyright"] = "-- help me fill it out this copyright notice --"
    poet = attributes.get("poet")
    composer = attributes.get("composer")
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


def write_toml(path: Path, attributes: attr.Attributes) -> None:
    """ write the extracted per-song metadata file """
    lines = ["# extracted from the mako Vars part by scripts/convert_to_tera.py\n"]
    lines.append(f"default_version = {toml_str(attributes.get_default_version_name())}\n")
    lines.append("\n[attributes]\n")
    for key in attr.order:
        if key in attributes:
            lines.append(f"{key} = {toml_str(attributes[key])}\n")
    lines.append("\n[has]\n")
    for key in attr.order:
        lines.append(f"{key} = {toml_str(key in attributes)}\n")
    lines.append("\n[computed]\n")
    for key, val in compute_scratch(attributes).items():
        lines.append(f"{key} = {toml_str(val)}\n")
    for name, version in attributes.versions.items():
        lines.append(f"\n[versions.{name}]\n")
        for key, val in version.items():
            lines.append(f"{key} = {toml_str(val)}\n")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("".join(lines), encoding="utf-8")


class DriverEmitter:
    """ partial evaluator turning common.ly.mako into one song's driver """

    def __init__(self, song_rel: Path, attributes: attr.Attributes, parts: dict[str, str]):
        self.song_rel = song_rel  # e.g. src/openbook/foo.ly.mako
        self.attributes = attributes
        self.version = attributes.get_working_version()
        # part name -> spliced text: a glued {% include %} tag or inline text
        self.parts = parts
        self.out: list[str] = []
        self.defs_body: str = ""
        self.clearvars_body: str = ""

    # ── static condition evaluation ──────────────────────────────────────

    def eval_condition(self, cond: str) -> bool | str:
        """ evaluate a mako condition: bool if static, tera expr if runtime """
        gattr = GATTR_SINGLE
        match = re.fullmatch(r"gattr\['(\w+)'\](==False)?", cond)
        if match:
            val = bool(gattr[match.group(1)])
            return (not val) if match.group(2) else val
        match = re.fullmatch(r"attributes.get_working_version\(\)\['(\w+)'\](==False)?", cond)
        if match:
            val = bool(self.version[match.group(1)])
            return (not val) if match.group(2) else val
        match = re.fullmatch(r"'(\w+)'( not)? in attributes", cond)
        if match:
            key = match.group(1)
            if key in RUNTIME_HAS and not match.group(2):
                return f"meta.has.{key}"
            present = key in self.attributes
            return (not present) if match.group(2) else present
        match = re.fullmatch(r"'(\w+)' in attributes and attributes\['(\w+)'\]", cond)
        if match:
            return match.group(1) in self.attributes and bool(self.attributes[match.group(1)])
        # the famous bare-name bug: `heb in attributes` compares mako's
        # UNDEFINED sentinel, so the condition is always False
        if re.fullmatch(r"heb in attributes and attributes\['heb'\]", cond):
            return False
        if re.fullmatch(r"file in gattr\['files'\]", cond):
            return True  # the loop body runs exactly once for a single tune
        raise ValueError(f"unhandled condition in common.ly.mako: {cond}")

    # ── text transforms ──────────────────────────────────────────────────

    def substitute(self, line: str) -> str:
        """ apply %% un-escaping, ${} mapping and include splicing to a text line """
        line = RE_ESCAPED_PCT.sub(r"\1%", line)
        line = RE_INCLUDE.sub(lambda m: self.splice_part(m.group(1)), line)
        replacements = {
            "${gattr['lilypond_version']}": "{{ lilypond_version }}",
            "${TONALITYTransposePitch}": "c",
            "${scratch['copyright']}": "{{ meta.computed.copyright }}",
            "${scratch['fullpoet']}": "{{ meta.computed.fullpoet }}",
            "${scratch['fullcomposer']}": "{{ meta.computed.fullcomposer }}",
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
        """ resolve an include tag's part expression to spliced driver text """
        if part_expr.startswith("'"):
            part = part_expr.strip("'")
        else:  # e.g. part=Chords where Chords='Chords'+default version name
            part = part_expr + self.attributes.get_default_version_name()
        return self.parts[part]

    # ── the evaluator ────────────────────────────────────────────────────

    def emit(self, text: str) -> None:
        """ append text to the driver """
        self.out.append(text)

    def run(self, common_text: str) -> str:
        """ evaluate common.ly.mako, return the driver template text """
        lines = common_text.splitlines(keepends=True)
        # frames: ("static", taking, seen_true) or ("runtime",)
        stack: list[tuple] = []
        index = 0

        def taking() -> bool:
            return all(f[0] == "runtime" or f[1] for f in stack)

        while index < len(lines):
            line = lines[index]
            stripped = line.strip()
            control = RE_CONTROL.match(line)
            if control:
                index += self.handle_control(control, stack, taking())
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
                self.emit('{% include "' + DEFS_TERA.as_posix() + '" %}\n')
                continue
            if "${self.clearVars()}" in line:
                self.emit(self.eval_def_body(self.clearvars_body) + "\n")
                continue
            self.emit(self.substitute(line))
        return "".join(self.out)

    def handle_control(self, control: re.Match, stack: list[tuple], was_taking: bool) -> int:
        """ process one %-control line; returns lines consumed (always 1) """
        keyword, cond = control.group(1), control.group(2)
        if keyword in ("if", "for"):
            if not was_taking:
                stack.append(("static", False, True))  # dead branch, swallow nesting
            else:
                value = True if keyword == "for" else self.eval_condition(cond)
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
        return 1

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
        inner = DriverEmitter(self.song_rel, self.attributes, self.parts)
        return inner.run(body)


def song_paths() -> list[Path]:
    """ all song templates, stable order """
    return sorted(SRC.rglob("*.ly.mako"))


def golden_render(song: Path) -> bytes:
    """ render one song through the mako pipeline as wrapper_mako does """
    import config.openbook  # pylint: disable=import-outside-toplevel
    gattr = dict(GATTR_SINGLE)
    gattr["files"] = [str(song)]
    gattr["lilypond_version"] = config.openbook.lilypond_version
    template = mako.template.Template(
        filename=str(COMMON), lookup=lookup(), input_encoding="utf-8", output_encoding="utf-8",
    )
    attributes = attr.Attributes()
    return template.render(attributes=attributes, gattr=gattr, scratch={})


def cmd_golden() -> int:
    """ build the golden corpus """
    count = 0
    for song in song_paths():
        out = GOLDEN / song.relative_to(SRC).with_suffix("").with_suffix(".ly")
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_bytes(golden_render(song))
        count += 1
    print(f"golden: rendered {count} songs into {GOLDEN}")
    return 0


def needed_parts(attributes: attr.Attributes) -> list[str]:
    """ the parts common.ly.mako will include for this song, in include order """
    version = attributes.get_working_version()
    default = attributes.get_default_version_name()
    parts = ["Defs", "Vars"]
    if not version["doOwn"]:
        if version["doPrep"]:
            parts.append("Prep")
        for flag, stem in (
            ("doChords", "Chords"), ("doVoice", "Voice"), ("doLyrics", "Lyrics"),
            ("doLyricsmore", "Lyricsmore"), ("doLyricsmoremore", "Lyricsmoremore"),
        ):
            if version[flag]:
                parts.append(stem + default)
    if version["doOwn"]:
        parts.append("Own")
    if version["doExtra"]:
        parts.append("Extra")
    return parts


RE_PART_SECTION = re.compile(r"^%\s*if part\s*==\s*'(\w+)'", re.MULTILINE)


def source_parts(song: Path) -> set[str]:
    """ every part name a song's source defines, whatever its version """
    return set(RE_PART_SECTION.findall(song.read_text(encoding="utf-8")))


def convert_song(song: Path) -> None:
    """ convert one song: TOML + part files + driver """
    rel = song.relative_to(SRC)  # <book>/.../<name>.ly.mako
    stem = rel.name[: -len(".ly.mako")]
    tera_dir = SRC_TERA / rel.parent
    attributes = capture_vars(song)
    write_toml(tera_dir / f"{stem}.toml", attributes)

    # extract every part the source defines (all versions, Doc included) so
    # no content is lost, plus the parts the driver splices even when absent
    parts: dict[str, str] = {}
    for part in sorted(source_parts(song) | set(needed_parts(attributes))):
        scratch_attributes = attr.Attributes()  # Vars re-executes; must start clean
        scratch_attributes.reset()
        text = render_song_part(song, part, scratch_attributes)
        if text.strip() == "":
            parts[part] = text  # inline pure whitespace, no file needed
        else:
            part_path = tera_dir / f"{stem}.{part}.ly.tera"
            part_path.parent.mkdir(parents=True, exist_ok=True)
            part_path.write_text(text, encoding="utf-8")
            parts[part] = '{% include "' + part_path.as_posix() + '" %}'

    emitter = DriverEmitter(Path("src") / rel, attributes, parts)
    driver_body = emitter.run(COMMON.read_text(encoding="utf-8"))
    toml_path = (SRC_TERA / rel.parent / f"{stem}.toml").as_posix()
    header = (
        '{% set meta = load_toml(path="' + toml_path + '") %}'
        '{% set lilypond_version = shell_output(command=\'' + LILYPOND_VERSION_CMD + "', depends_on=[]) %}"
        '{% set date = shell_output(command="' + DATE_CMD + '", depends_on=[]) %}'
    )
    driver = DRIVERS / rel.parent / f"{stem}.ly.tera"
    driver.parent.mkdir(parents=True, exist_ok=True)
    driver.write_text(header + driver_body, encoding="utf-8")

    if not DEFS_TERA.exists() and emitter.defs_body:
        DEFS_TERA.parent.mkdir(parents=True, exist_ok=True)
        DEFS_TERA.write_text(emitter.eval_def_body(emitter.defs_body), encoding="utf-8")


def cmd_convert() -> int:
    """ convert the whole corpus """
    failures = []
    count = 0
    for song in song_paths():
        try:
            convert_song(song)
            count += 1
        except Exception as exc:  # noqa: BLE001  # pylint: disable=broad-exception-caught
            failures.append((song, exc))
    print(f"convert: {count} songs converted, {len(failures)} failed")
    for failed_song, failure in failures:
        print(f"  FAIL {failed_song}: {failure}")
    return 1 if failures else 0


def cmd_compare() -> int:
    """ compare tera output against the golden corpus """
    tera_out = Path("out/tera/src")
    same, differ, missing = [], [], []
    for gold in sorted(GOLDEN.rglob("*.ly")):
        candidate = tera_out / gold.relative_to(GOLDEN)
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
    parser.add_argument("command", choices=["golden", "convert", "compare"])
    args = parser.parse_args()
    return {"golden": cmd_golden, "convert": cmd_convert, "compare": cmd_compare}[args.command]()


if __name__ == "__main__":
    sys.exit(main())
