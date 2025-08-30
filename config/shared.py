""" shared stuff """

# config for python module
PCONFIG: list[str] = [
    "pyclassifiers",
]
# build for python module
PBUILD: list[str] = [
    "pyclassifiers",
    "pydmt",
    "pymakehelper",
    "pycmdtools",
]
# test for python module
PTEST: list[str] = [
    "pylint",
    "pytest",
    "mypy",
    "ruff",
    # "pytest-cov",
]
# deps for python module
PDEPS: list[str] = [
    "ripgrep",
]
# config for non python module
CONFIG: list[str] = [
]
# build for non python module
BUILD: list[str] = [
    "pyclassifiers",
    "pydmt",
    "pymakehelper",
    "pycmdtools",
]
# test for non python module
TEST: list[str] = [
    "pylint",
    "pytest",
    "mypy",
    "ruff",
]
# deps for non python module
DEPS: list[str] = [
]
