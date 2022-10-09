#!/usr/bin/env python

"""
Implementing grep in python
"""

import re
import sys
import os


def main():
    """ main entry point """
    if len(sys.argv) != 4:
        print("usage: grep.py [expr] [file_regexp] [folder]")
        sys.exit(1)
    # first compile the regular expression to search for...
    compiled_expr = re.compile(sys.argv[1])
    compiled_file_regexp = re.compile(sys.argv[2])
    folder = sys.argv[3]
    debug = False
    print_only_files = False
    printed_files = set()

    if debug:
        print(f"folder is {folder}")

    for root, _dirs, files in os.walk(folder):
        for file in files:
            full = os.path.join(root, file)
            if debug:
                print(f"file is [{full}]")
            if compiled_file_regexp.match(full):
                if debug:
                    print(f"doing file [{full}]")
                with open(full, encoding="utf-8") as stream:
                    for num, line in enumerate(stream):
                        for _ in compiled_expr.finditer(line):
                            if print_only_files:
                                if full not in printed_files:
                                    print(full)
                                    printed_files.add(full)
                            else:
                                print(f"{full}, {num}: {line[:-1]}")


if __name__ == "__main__":
    main()
