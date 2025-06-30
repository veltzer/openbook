""" shared stuff """

PCONFIG: list[str] = [
    "pyclassifiers",
]
# build for python module
PBUILD: list[str] = [
    "hatch",
    "pydmt",
    "pymakehelper",
    "pycmdtools",
]
# build for non python module
BUILD: list[str] = [
    "pydmt",
    "pymakehelper",
    "pycmdtools",
]
# testing for python modules
PTEST: list[str] = [
    "pylint",
    "pytest",
    "mypy",
    "ruff",
    # "pytest-cov",
]
# testing for non python modules
TEST: list[str] = [
    "pylint",
    "pytest",
    "mypy",
    "ruff",
]
