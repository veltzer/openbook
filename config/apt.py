import glob
import os
import subprocess

import config.general

apt_protocol = "https"
apt_codename = subprocess.check_output(["lsb_release", "--codename", "--short"]).decode().rstrip()
apt_arch = subprocess.check_output(
    "dpkg-architecture | grep -e ^DEB_BUILD_ARCH= | cut -d = -f 2", shell=True
).decode().rstrip()
apt_architectures = f"{apt_arch} source"
apt_component = "main"
apt_folder = "apt"
apt_service_dir = os.path.join(
    config.general.general_homedir, "public_html/public", apt_folder
)
apt_pack_list = glob.glob(
    os.path.join(config.general.general_homedir, "packages", "*.deb")
)
apt_pack_str = " ".join(apt_pack_list)
apt_id = subprocess.check_output(["lsb_release", "--id", "--short"]).decode().rstrip()
apt_key_file = "public_key.gpg"
