import config.project

package_name = config.project.project_name

console_scripts = [
]

setup_requires = [
]

install_requires = [
]

test_requires = [
]

dev_requires = {
    'pydmt': 'for building the project',
    'pytconf': 'for command line parsing',
    'python-dateutil': 'for doing graphs of progress',
    'tqdm': 'for doing graphs of progress',
    'PyMySQL': 'for doing graphs of progress',
    'mako': 'the templating solution used by this project',
    'pymakehelper': 'help module for writing makefiles easier',
}
# test_os="[ubuntu-16.04, ubuntu-18.04, macos-10.15]"
test_os="[ubuntu-16.04, ubuntu-18.04, ubuntu-20.04]"
test_python="[3.6, 3.7, 3.8]"
test_container="[ 'ubuntu:18.04', 'ubuntu:20.04' ]"

python_requires = ">=3"

# deb section
deb_package = False
