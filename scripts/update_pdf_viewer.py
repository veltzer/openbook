#!/usr/bin/env python3

import subprocess
import os
import shutil
import config.openbook

temp_file="/tmp/viewer.zip"
if os.path.exists(temp_file):
    os.unlink(temp_file)
subprocess.check_call([
    "wget",
    """https://github.com/mozilla/pdf.js/releases/download/
    v{}/pdfjs-${}-dist.zip""".format(config.openbook.pdfjs_version),
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
