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

dev_requires = [
    'pydmt',
    'pytconf',
    'python-dateutil',
    'tqdm',
    'PyMySQL',
    'mako',
    'pymakehelper',
]
test_os="[ubuntu-16.04, ubuntu-18.04, macos-10.15]"
test_python="[3.6, 3.7, 3.8]"

python_requires = ">=3"

# deb section
deb_package = False
