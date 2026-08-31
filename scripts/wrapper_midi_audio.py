#!/usr/bin/env python

"""
Render midi files to audio for the rsconstruct generator processors
(midi2wav, midi2ogg, midi2mp3). Replaces the old perl wrappers
(scripts/midi2wav.pl, midi2ogg.pl, midi2mp3.pl) that backed the Makefile's
DO_WAV / DO_OGG / DO_MP3 targets, with the same tool invocations:

    wav: timidity <in> -idq -Ow -o <out>
    ogg: timidity <in> -idq -Ov -o <out>
    mp3: timidity <in> -idq -Ow -o - | lame - <out>

Invoked per the generator-processor contract with (input, output) pairs:

    python -m scripts.wrapper_midi_audio in1.midi out1.wav [in2.midi out2.wav ...]

The target format is deduced from the output extension. On failure the
output is removed so no partial file is left behind.
"""

import subprocess
import sys
from pathlib import Path


def render(source: Path, output: Path) -> int:
    """ render one midi file to one audio file """
    output.unlink(missing_ok=True)
    output.parent.mkdir(parents=True, exist_ok=True)
    if output.suffix == ".wav":
        command = ["timidity", str(source), "-idq", "-Ow", "-o", str(output)]
    elif output.suffix == ".ogg":
        command = ["timidity", str(source), "-idq", "-Ov", "-o", str(output)]
    elif output.suffix == ".mp3":
        timidity = ["timidity", str(source), "-idq", "-Ow", "-o", "-"]
        lame = ["lame", "--quiet", "-", str(output)]
        command = timidity + ["|"] + lame
        with subprocess.Popen(timidity, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as producer:
            result = subprocess.run(
                lame, stdin=producer.stdout, capture_output=True, check=False)
            _, timidity_err = producer.communicate()
        if producer.returncode != 0 or result.returncode != 0:
            return fail(command, output, timidity_err + result.stderr)
        return 0
    else:
        print(f"unknown output format [{output}]", file=sys.stderr)
        return 1
    result = subprocess.run(command, capture_output=True, check=False)
    if result.returncode != 0 or not output.is_file():
        return fail(command, output, result.stdout + result.stderr)
    return 0


def fail(command: list[str], output: Path, log: bytes) -> int:
    """ report a failed conversion and remove any partial output """
    output.unlink(missing_ok=True)
    sys.stderr.buffer.write(log)
    print(f"[{' '.join(command)}] failed", file=sys.stderr)
    return 1


def main() -> int:
    """ main entry point """
    args = sys.argv[1:]
    if not args or len(args) % 2 != 0:
        print(f"usage: {sys.argv[0]} input output [input output ...]", file=sys.stderr)
        return 1
    for source, output in zip(args[::2], args[1::2]):
        if (code := render(Path(source), Path(output))) != 0:
            return code
    return 0


if __name__ == "__main__":
    sys.exit(main())
