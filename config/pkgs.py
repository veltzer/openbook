"""
This simply extracts the description of a package.

References:
- https://docs.python.org/3/library/importlib.metadata.html
"""

from importlib.metadata import metadata

def get_package_description(name: str) -> str:
    s = metadata(name)
    return s["Summary"]
