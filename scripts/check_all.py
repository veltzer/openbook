#!/usr/bin/env python

"""
Source checks for the song sources, migrated from the old `make check_all`
target and the retired scripts/check.py to the tera song tree under src/.

Invoked per the rsconstruct explicit-processor contract:

    python -m scripts.check_all \
        --inputs src/... \
        --output-files out/checks/check_all.stamp

On success the stamp file is written; on any finding every error is printed
to stderr as file:line: reason and the exit code is 1.
"""

import argparse
import re
import sys
from pathlib import Path

# jazz tunes get extra conventions checks (was src/openbook in make)
JAZZ_PREFIX = "src/openbook/"
# a \myMark must name a song section
MYMARK_SECTIONS = re.compile(r"A|B|C|D|Intro|End|Instr")
# multiple authors are comma separated, never "X and Y"
AUTHORS_AND = re.compile(r"(composer|poet)\s*=\s*\".* and .*\"")
# tera part blocks, e.g. {% if part == "VoiceReal" %}
PART_IF = re.compile(r"\{%-?\s*if part == \"(\w+)\"")
PART_END = re.compile(r"\{%-?\s*endif")


class Checker:
    """ Accumulates errors over the checked files """

    def __init__(self) -> None:
        self.errors = 0

    def error(self, file: str, num: int, reason: str, line: str = "") -> None:
        """ report a single finding """
        self.errors += 1
        print(f"{file}:{num}: {reason} {line}".rstrip(), file=sys.stderr)

    def check_line(self, file: str, num: int, line: str) -> None:
        """ context-free per-line checks (the old grep based targets) """
        if line != line.rstrip():
            self.error(file, num, "trailing whitespace")
        if " \t" in line or "\t " in line:
            self.error(file, num, "line has tabs and spaces mixed")
        if "\\myMark" in line and not MYMARK_SECTIONS.search(line):
            self.error(file, num, "naked myMark", line)
        if AUTHORS_AND.search(line):
            self.error(file, num, "composer/poet with 'and'", line)
        if "%% part" in line and "\"" not in line:
            self.error(file, num, "part without a quoted name", line)
        if "\\alternative" in line and "}" not in line:
            self.error(file, num, "alternative without closing brace", line)
        if "\\tempo " in line and "\"" not in line:
            self.error(file, num, "tempo without a quoted name", line)
        if "\\myEndLine" in line and "%%" in line:
            self.error(file, num, "myEndLine and comment on the same line", line)
        if "relative" in line and not line.endswith("\\relative c' {"):
            self.error(file, num, "relative which is not standard", line)
        if re.search(r"copyright\s*=\s*\"\"", line):
            self.error(file, num, "empty copyright")
        if "\\bar" in line or "\\include" in line or "\\break" in line:
            self.error(file, num, "use of illegal lilypond symbol", line)

    def check_jazz_line(self, file: str, num: int, line: str) -> None:
        """ per-line checks that only apply to the jazz tunes """
        if "\\key" in line and "major" not in line and "minor" not in line:
            self.error(file, num, "key is neither major nor minor", line)

    def check_tempo_time_key(self, file: str, num: int, line: str, state: int) -> int:
        """ enforce the \\tempo, \\time, \\key declaration order """
        if state == 2:
            if "\\key" not in line:
                self.error(file, num, "key after tempo", line)
            return 0
        if state == 1:
            if "\\time" not in line:
                self.error(file, num, "time after key", line)
            return 2
        if "\\tempo" in line:
            return 1
        return 0

    def check_file(self, path: Path) -> None:
        """ check a single source file """
        file = str(path)
        jazz = file.startswith(JAZZ_PREFIX)
        text = path.read_text(encoding="utf-8")
        lines = text.split("\n")
        part: str | None = None
        prev = None
        prevprev = None
        tempo_time_key = 0
        for num, line in enumerate(lines, start=1):
            if match := PART_IF.search(line):
                part = match.group(1)
            elif PART_END.search(line):
                part = None
            self.check_line(file, num, line)
            if jazz:
                self.check_jazz_line(file, num, line)
            if part is not None and part.startswith("Voice") and "\\myEndLine" in line:
                self.error(file, num, "myEndLine inside a voice part", line)
            if part is not None and part.startswith("Chords") and "\\myMark" in line and prev != "":
                self.error(file, num, "myMark with no empty line before it", line)
            if "%% part" in line and prev != "":
                self.error(file, num, "part with no empty line before it", line)
            if "%% part" in line and prev == "" and prevprev == "":
                self.error(file, num, "part with two empty lines before it", line)
            tempo_time_key = self.check_tempo_time_key(
                file, num, line, tempo_time_key)
            prevprev = prev
            prev = line
        if jazz:
            if "\\myMark" not in text:
                self.error(file, 0, "no myMark in jazz tune")
            if "alternative" in text and "myEndLineVolta" not in text:
                self.error(file, 0, "alternative without myEndLineVolta")


def main() -> int:
    """ main entry point """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs", nargs="+", required=True)
    parser.add_argument("--output-files", nargs="+", required=True, dest="output_files")
    args = parser.parse_args()
    checker = Checker()
    for name in args.inputs:
        # inputs may carry this script itself (declared for dependency
        # tracking); the shared include is a template fragment, not a song
        if not name.endswith(".ly.tera") or "src/include/" in name:
            continue
        checker.check_file(Path(name))
    if checker.errors > 0:
        print(f"check_all: {checker.errors} error(s)", file=sys.stderr)
        return 1
    for output in args.output_files:
        stamp = Path(output)
        stamp.parent.mkdir(parents=True, exist_ok=True)
        stamp.write_text("", encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
