#!/usr/bin/env python

"""
Serve the GitHub Pages site locally, exactly as CI would publish it.

The served directory is whatever `rsconstruct pages dir` reports (the
[pages] section of rsconstruct.toml), so this script never duplicates
that knowledge. Run a build first so docs/index.html and the books in
docs/output/ exist:

    rsconstruct build
    python -m scripts.serve_pages [port]

Then browse http://localhost:8000/ (or the port you passed).
"""

import functools
import http.server
import subprocess
import sys

DEFAULT_PORT = 8000


def pages_dir() -> str:
    """ ask rsconstruct which directory is published to GitHub Pages """
    result = subprocess.run(
        ["rsconstruct", "pages", "dir"],
        capture_output=True, text=True, check=True,
    )
    directory = result.stdout.strip()
    if not directory:
        raise SystemExit("no [pages] section in rsconstruct.toml - nothing to serve")
    return directory


def main() -> int:
    """ main entry point """
    port = int(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_PORT
    directory = pages_dir()
    handler = functools.partial(
        http.server.SimpleHTTPRequestHandler, directory=directory)
    server = http.server.ThreadingHTTPServer(("", port), handler)
    print(f"serving [{directory}] at http://localhost:{port}/ (Ctrl+C to stop)")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nbye")
    return 0


if __name__ == "__main__":
    sys.exit(main())
