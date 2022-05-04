import config.project

package_name = config.project.project_name

console_scripts = [
]

run_requires = [
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
    'Mako',
    'pymakehelper',
    'requests',
    'gitpython',
]
python_requires = ">=3"

test_os = ["ubuntu-20.04"]
test_python = ["3.9"]
test_container = ["ubuntu:20.04"]
