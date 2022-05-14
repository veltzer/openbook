import config.project

package_name = config.project.project_name

install_requires = [
    "pytconf",
    "python-dateutil",
    "tqdm",
    "PyMySQL",
    "Mako",
    "requests",
    "gitpython",
]
make_requires = [
    "pymakehelper",
]

python_requires = ">=3.10"

test_os = ["ubuntu-22.04"]
test_python = ["3.10"]
