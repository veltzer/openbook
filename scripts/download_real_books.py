#!/usr/bin/env python

"""
Download and unpack the scanned real-books reference archive. Replaces the
old `make real_books_archive.gi` target. The archive is extracted at the
repository root (creating real_books_archive.gi/, which is gitignored via
the /*.gi pattern).

Invoked per the rsconstruct explicit-processor contract:

    python -m scripts.download_real_books \
        --inputs scripts/download_real_books.py \
        --output-files out/real_books/real_books.stamp
"""

import argparse
import io
import sys
import tarfile
from pathlib import Path

import requests

URL = "https://www.dropbox.com/s/birwhwe6g7ojqnh/real_books_archive.gi.tar.gz?dl=1"


def main() -> int:
    """ main entry point """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs", nargs="+", required=True)
    parser.add_argument("--output-files", nargs="+", required=True, dest="output_files")
    args = parser.parse_args()
    response = requests.get(URL, timeout=600)
    response.raise_for_status()
    with tarfile.open(fileobj=io.BytesIO(response.content), mode="r:gz") as archive:
        archive.extractall(filter="data")
    for output in args.output_files:
        stamp = Path(output)
        stamp.parent.mkdir(parents=True, exist_ok=True)
        stamp.write_text("", encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
