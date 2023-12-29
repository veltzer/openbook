config_requires = []
dev_requires = []
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
    "pydmt",
    "pyclassifiers",
]
test_requires = [
    "pylint",
]
requires = config_requires + install_requires + make_requires + test_requires
