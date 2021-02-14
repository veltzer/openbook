"""
It seems that all that is in this helper can be done with pip or
pkg_resources as described here:
https://stackoverflow.com/questions/20683118/how-to-access-python-package-metadata-from-within-the-python-console
"""

import importlib
import os.path
import glob

translate = {
    "python-dateutil": "python_dateutil",
}

import_name_translate = {
    "Mako": "mako",
    "python-dateutil": "dateutil",
    "PyMySQL": "pymysql",
}


def get_metadata(filename: str):
    d = dict()
    with open(filename) as f:
        for line in f:
            line = line.rstrip()
            pos = line.find(':')
            key = line[0:pos]
            value = line[pos + 2:]
            d[key] = value
    return d


def get_package_description(name: str) -> str:
    if name in translate:
        folder = translate[name]
    else:
        folder = name
    if name in import_name_translate:
        import_name = import_name_translate[name]
    else:
        import_name = name
    # noinspection PyBroadException
    try:
        tmp = importlib.import_module(import_name)
    except Exception:
        return f"could not import [{import_name}]"
    location = tmp.__file__
    dirname = os.path.dirname(location)
    dirname = os.path.dirname(dirname)
    glob_pattern = os.path.join(dirname, f"{folder}-*.dist-info")
    candidates = glob.glob(glob_pattern)
    if len(candidates) != 1:
        raise ValueError(f"could not find folder")
    dirname = candidates[0]
    metadata = os.path.join(dirname, "METADATA")
    metadata_dict = get_metadata(metadata)
    summary = metadata_dict["Summary"]
    return summary
