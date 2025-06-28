""" python deps for this project """

install_requires: list[str] = [
    "pytconf",
    "python-dateutil",
    "tqdm",
    "PyMySQL",
    "Mako",
    "requests",
    "gitpython",
]
build_requires: list[str] = [
    "pydmt",
    "pymakehelper",
    "pylint",
]

requires = install_requires + build_requires
