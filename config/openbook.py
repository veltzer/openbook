import subprocess

lilypond_version = subprocess.check_output(['lilypond', '--version']).decode().split("\n")[0].split(" ")[2]
# pdfjs_version = "2.3.200"
pdfjs_version = "2.7.570"
