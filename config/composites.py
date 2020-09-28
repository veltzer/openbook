import config.apt
import config.git

deb_version = f"{config.git.git_version}~{config.apt.apt_codename}"
