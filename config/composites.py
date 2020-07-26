import config.apt
import config.git

deb_version = '{0}~{1}'.format(config.git.git_version, config.apt.apt_codename)
