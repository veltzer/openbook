#!/usr/bin/python3

import sys # for version_info

def check_version():
    version_needed=(3,5)
    if sys.version_info[0:2] != version_needed:
        raise Exception('you must use python {ver}'.format(
            ver=version_needed,
        ))

if __name__=='__main__':
    check_version()
