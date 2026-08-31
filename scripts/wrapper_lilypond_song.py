#!/usr/bin/env python

"""
Compile single songs with lilypond for the rsconstruct generator processors
(songs_pdf, songs_ps, songs_midi). Replaces the per-song pdf/ps/midi rules
of the old Makefile (DO_PDF / DO_PS / DO_MIDI).

Invoked per the generator-processor contract with (input, output) pairs:

    python -m scripts.wrapper_lilypond_song in1.ly out1.pdf [in2.ly out2.pdf ...]

The requested format is deduced from the output extension. lilypond always
engraves every format it is asked for plus midi, so each song is compiled
in a scratch directory and only the requested file is moved to the output
path — the build tree gets exactly the declared outputs, nothing else.
"""

import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

FORMAT_ARGS = {
    ".pdf": ["--pdf"],
    ".ps": ["--ps"],
    ".midi": ["-dno-print"],
}


def compile_song(source: Path, output: Path) -> int:
    """ compile one song to one output file """
    extra = FORMAT_ARGS.get(output.suffix)
    if extra is None:
        print(f"unknown output format [{output}]", file=sys.stderr)
        return 1
    with tempfile.TemporaryDirectory(prefix="lilypond_song.") as scratch:
        base = Path(scratch) / output.stem
        command = ["lilypond"] + extra + ["-o", str(base), str(source)]
        result = subprocess.run(command, capture_output=True, text=True, check=False)
        produced = base.with_suffix(output.suffix)
        if result.returncode != 0 or not produced.is_file():
            sys.stderr.write(result.stdout)
            sys.stderr.write(result.stderr)
            print(f"[{' '.join(command)}] failed (rc={result.returncode})", file=sys.stderr)
            return 1
        output.unlink(missing_ok=True)
        output.parent.mkdir(parents=True, exist_ok=True)
        shutil.move(produced, output)
    return 0


def main() -> int:
    """ main entry point """
    args = sys.argv[1:]
    if not args or len(args) % 2 != 0:
        print(f"usage: {sys.argv[0]} input output [input output ...]", file=sys.stderr)
        return 1
    for source, output in zip(args[::2], args[1::2]):
        if (code := compile_song(Path(source), Path(output))) != 0:
            return code
    return 0


if __name__ == "__main__":
    sys.exit(main())
