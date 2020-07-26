import os
import subprocess
import config.project

deb_package = True
deb_section = 'python'
deb_priority = 'optional'
deb_architecture = 'all'
deb_package_name = config.project.project_name
# to which series to publish the package?
deb_series = [
    'artful',
    'zesty',
    'xenial',
    'trusty',
]
deb_depends = '${misc:Depends}, ${python3:Depends}, python3-mako'
deb_build_depends = 'python3, python3-setuptools, debhelper, dh-python'
deb_standards_version = '3.9.8'
deb_x_python_version = '>= 3.4'
deb_x_python3_version = '>= 3.4'
deb_urgency = 'low'
# archive of package
deb_repo = os.path.expanduser('~/packages')
# where to put packages that are built?
deb_out_folder = 'out'
# build_all = build.all
# where to build source packages?
# build_source = build.source
# where to build source packages?
# build_gbp = build.gbp

# for example 'Mon, 17 Oct 2016 09:44:00 +0300'
deb_date = subprocess.check_output("date -R").decode().rstrip()
