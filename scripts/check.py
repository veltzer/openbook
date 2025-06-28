#!/usr/bin/env python

"""
This scripts checks our lilypond source files for common mistakes
and best practices.

One of the things it checks is that we have \\myEndLine in voices
"""

import glob
import sys

DEBUG = False


def error(num, line, file, reason):
    """ print an error message with all details """
    print(f"{file}:{num}:{reason} {line}", file=sys.stderr)


# pylint: disable=too-many-statements, too-many-branches
def check_file(file):
    """ check a single file """
    inside_voice = False
    inside_chords = False
    inside_python = False
    state_tempo_time_key = 0
    prevprev = None
    prev = None
    with open(file, encoding="utf-8") as stream:
        for num, line in enumerate(stream):
            line = line.rstrip("\n")
            if line == "<%":
                inside_python = True
            if inside_python and line.find("\"") != -1:
                error(num, line, file, "double quotes in python code")
            if line == "%>":
                inside_python = False
            if line.startswith("% if part==\'Voice"):
                inside_voice = True
            if line == "% endif":
                inside_voice = False
            if inside_voice:
                if line.find("\\myEndLine") != -1:
                    error(num, line, file, "have end line")
            if line.startswith("% if part==\'Chords"):
                inside_chords = True
            if line == "% endif":
                inside_chords = False
            if inside_chords and line.find("\\myMark") != -1 and prev != "":
                error(num, line, file, "myMark with no empty line before it")
            if line.find("%% part") != -1 and prev != "":
                error(num, line, file, "part with no empty line before it")
            if line.find("\box") != -1 and prev != "":
                error(num, line, file, "box with no empty line before it")
            if line.find("%% part") != -1 and prev == "" and prevprev == "":
                error(num, line, file, "part with two empty lines before it")
            if line.find("\\myEndLine") != -1 and line.find("%%") != -1:
                error(num, line, file, "myEndLine and comment on the same line")
            if line.find("relative") != -1 and not line.endswith("\\relative c\' {"):
                error(num, line, file, "relative which is not standard")
            if line == "}" and prev == "":
                error(num, line, file, "close curly with preceeding empty line")
            if line.find(":min") != -1 or line.find("___") != -1 or \
                    line.find("chordChanges") != -1 or line.find(
                    "_ --") != -1:
                error(num, line, file, "bad symbols")
            if line.find("copyright = ''") != -1:
                error(num, line, file, "empty copyright")
            if line.endswith("\t") or line.endswith(" "):
                error(num, line, file, "line ends with tab or space")
            if line.find(" \t") != -1 or line.find("\t ") != -1:
                error(num, line, file, "line has tabs and spaces mixed")
            if line.find("] = '' ") != -1:
                error(num, line, file, "empty field")
            if line.find("\\bar") != -1 or line.find("\\include") != -1 \
                    or line.find("\break") != -1:
                error(num, line, file, "use of illegal lilypond symbol")
            if state_tempo_time_key == 2:
                if line.find("\\key") == -1:
                    error(num, line, file, "key after tempo")
                else:
                    state_tempo_time_key = 0
            if state_tempo_time_key == 1:
                if line.find("\\time") == -1:
                    error(num, line, file, "time after key")
                else:
                    state_tempo_time_key = 2
            if line.find("\\tempo") != -1:
                if state_tempo_time_key != 0:
                    error(num, line, file, "tempo after time")
                else:
                    state_tempo_time_key = 1
            prevprev = prev
            prev = line


def main():
    """ main entry point """
    for file in glob.glob("src/**/*.mako"):
        if DEBUG:
            print(f"doing [{file}]")
        check_file(file)


if __name__ == "__main__":
    main()
