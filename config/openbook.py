import subprocess

lilypond_version = subprocess.check_output(['lilypond', '--version']).decode().split("\n")[0].split(" ")[2]
