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
build_requires = [
    "pymakehelper",
    "pydmt",
    "pyclassifiers",
]
test_requires = [
    "pylint",
]
requires = config_requires + install_requires + build_requires + test_requires
