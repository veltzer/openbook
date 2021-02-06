#!/usr/bin/env python3

import subprocess
import os
import shutil
import config.openbook

"""
Find the latest version and download it
"""

temp_file="/tmp/viewer.zip"
if os.path.exists(temp_file):
    os.unlink(temp_file)
url=(
    "https://github.com/mozilla/pdf.js/releases/download/"
    f"v{config.openbook.pdfjs_version}/pdfjs-{config.openbook.pdfjs_version}-dist.zip"
)
subprocess.check_call([
    "wget",
    url,
    "-O",
    temp_file,
])
shutil.rmtree("docs/build", ignore_errors=True)
shutil.rmtree("docs/web", ignore_errors=True)
subprocess.check_call([
    "unzip",
    temp_file,
    "-d",
    "docs",
    "-x",
    "LICENSE",
])
os.unlink(temp_file)
