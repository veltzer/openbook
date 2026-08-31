"""
Compile a LilyPond source to pdf+ps for the rsconstruct explicit processor.

Invoked per the explicit-processor contract:

    python -m scripts.wrapper_lilypond_explicit \
        --inputs out/tera/books/<name>.ly \
        --output-files out/tera/books/<name>.pdf out/tera/books/<name>.ps

Same decisions as scripts/wrapper_lilypond.py, the make-driven wrapper:
suppress lilypond's console noise unless it fails, and never leave
partial outputs behind on error.
"""

import argparse
import subprocess
import sys
from pathlib import Path


def remove_if_exist(paths: list[Path]) -> None:
    """ best-effort removal of output files """
    for path in paths:
        path.unlink(missing_ok=True)


def main() -> int:
    """ main entry point """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs", nargs="+", required=True)
    parser.add_argument("--output-files", nargs="+", required=True, dest="output_files")
    args = parser.parse_args()
    if len(args.inputs) != 1:
        raise ValueError(f"expected exactly one .ly input, got {args.inputs}")
    source = Path(args.inputs[0])
    outputs = [Path(p) for p in args.output_files]
    stems = {p.parent / p.stem for p in outputs}
    if len(stems) != 1:
        raise ValueError(f"outputs must share one basename, got {args.output_files}")
    base = stems.pop()

    remove_if_exist(outputs)
    command = ["lilypond", "--ps", "--pdf", "-o", str(base), str(source)]
    result = subprocess.run(command, capture_output=True, text=True, check=False)
    missing = [p for p in outputs if not p.is_file()]
    if result.returncode != 0 or missing:
        remove_if_exist(outputs)
        sys.stderr.write(result.stdout)
        sys.stderr.write(result.stderr)
        print(f"{sys.argv[0]}: [{' '.join(command)}] failed "
              f"(rc={result.returncode}, missing={missing})", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
