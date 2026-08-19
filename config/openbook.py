""" lilypond version discovery for the mako song templates """

import subprocess

lilypond_version = subprocess.check_output(
    ['lilypond', '--version'],
).decode().split("\n", maxsplit=1)[0].split(" ")[2]
