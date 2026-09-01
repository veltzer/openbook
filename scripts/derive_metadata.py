#!/usr/bin/env python

"""
Derive one song's render-time metadata (out/derived/<book>/<song>.ly.toml)
from the TOML front matter of its src/<book>/<song>.ly.tera source.

This is the build-time face of the derivation that scripts/drivers.py
performs when regenerating the driver templates: the drivers reference
these files via load_toml, and this generator keeps them in sync with
the front matter on every build (the drivers themselves only change
when a song is added or removed).

Invoked per the rsconstruct generator-processor contract with
(input, output) pairs:

    python -m scripts.derive_metadata in.ly.tera out.ly.toml [...]
"""

import sys
from pathlib import Path

from scripts.drivers import derived_content, parse_song_meta


def main() -> int:
    """ main entry point """
    args = sys.argv[1:]
    if not args or len(args) % 2 != 0:
        print(f"usage: {sys.argv[0]} input output [input output ...]", file=sys.stderr)
        return 1
    for source, output in zip(args[::2], args[1::2]):
        meta = parse_song_meta(Path(source))
        out = Path(output)
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(derived_content(meta), encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
