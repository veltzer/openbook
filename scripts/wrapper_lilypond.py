#!/usr/bin/env python


"""
wrapper to run lilypond.
run lilypond to produce the book
lilypond --ps --pdf --output=$(OUT_BASE) $(OUT_LY)

Why do we need this script?
- To make sure to remove the outputs (all of them - ps, pdf, ...) in any case of error.
- To get over lilypond printing junk on the console that I don't want to see when building.
- To get over the fact that lilypond does not have a "treat warnings as errors and stop" flag.
- To print the lilypond output, but only in case of error.
- To do extra stuff on the output coming out from lilypond like reduce the size of the pdf and more.
"""

import sys
import os
import subprocess
import os.path
import shutil
import tempfile
from typing import List

from pytconf.config import Config, create_bool, create_enum, create_new_file, create_str, create_existing_file, \
    config_arg_parse_and_launch, register_endpoint, register_main
from pytconf.extended_enum import ExtendedEnum


def remove_outputs_if_exist():
    # type: () -> None
    """
    remove the target files, do nothing if they are not there
    :return:
    """
    if os.path.isfile(ConfigAll.ps):
        os.unlink(ConfigAll.ps)
    if os.path.isfile(ConfigAll.pdf):
        os.unlink(ConfigAll.pdf)


def print_outputs(output, errout, status, args):
    # type: (str, str, int, List[str]) -> None
    """
    print output of the program in case of error
    """
    if output != '':
        print('{0}: stdout is'.format(sys.argv[0]), file=sys.stderr)
        print(output, file=sys.stderr)
    if errout != '':
        print('{0}: stderr is'.format(sys.argv[0]), file=sys.stderr)
        print(errout, file=sys.stderr)
    print('{0}: return code is [{1}]'.format(sys.argv[0], status), file=sys.stderr)
    print('{0}: error in executing {1}'.format(sys.argv[0], args), file=sys.stderr)


def system_check_output(args):
    # type: (List[str]) -> None
    """
    this function is here because we want to supress output until we know
    there is an error (and subprocess.check_output does not do this)
    """
    # type: (List[str]) -> None
    if ConfigAll.do_debug:
        print('{0}: running [{1}]'.format(sys.argv[0], args), file=sys.stderr)
    pr = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, errout) = pr.communicate()
    output = output.decode()
    errout = errout.decode()
    if ConfigAll.do_debug or pr.returncode or (ConfigAll.stop_on_output and (output != '' or errout != '')):
        print_outputs(output, errout, pr.returncode, args)
        remove_outputs_if_exist()
        sys.exit(1)


class LilypondLogLevels(ExtendedEnum):
    NONE = 0
    ERROR = 1
    WARNING = 2
    BASIC = 3
    PROGRESS = 4
    INFO = 5  # this is the lilypond default
    DEBUG = 6


class ConfigAll(Config):
    """
    All parameters for the run
    """
    do_ps = create_bool(default=True, help_string="do postscript?")
    do_pdf = create_bool(default=True, help_string="do pdf?")
    do_debug = create_bool(default=False, help_string="emit debug info?")
    unlink_ps = create_bool(default=False, help_string="unlink the postscript file at the end?")
    do_qpdf = create_bool(default=True, help_string="do you want to linearize the pdf file afterwards?")
    # we should work with warnings and try and solve all of them
    loglevel = create_enum(
        enum_type=LilypondLogLevels,
        default=LilypondLogLevels.WARNING,
        help_string="what warning level do you want?",
    )
    do_pdfred = create_bool(default=False, help_string="should we reduce the pdf size?")
    # this should be set to True
    stop_on_output = create_bool(default=True, help_string="should we stop on any output from the lilypond process?")

    # parameters without defaults (should be supplied by the user on the command line)
    ps = create_new_file(help_string="postscript to produce")
    pdf = create_new_file(help_string="pdf to produce")
    out = create_str(help_string="pdf without suffix")
    ly = create_existing_file(help_string="lilypond input")


@register_endpoint(
    configs=[ConfigAll],
)
def run():
    if ConfigAll.do_debug:
        print('{0}: arguments are [{1}]'.format(sys.argv[0], sys.argv), file=sys.stderr)

    remove_outputs_if_exist()

    # run the command
    args = ['lilypond', '--loglevel={0}'.format(ConfigAll.loglevel.name)]
    if ConfigAll.do_ps:
        args.append('--ps')
    if ConfigAll.do_pdf:
        args.append('--pdf')
    args.append('--output=' + ConfigAll.out)
    args.append(ConfigAll.ly)
    try:
        # to make sure that lilypond shuts up...
        # subprocess.check_output(args)
        system_check_output(args)
        # chmod the results
        if ConfigAll.do_ps:
            os.chmod(ConfigAll.ps, 0o0444)
        if ConfigAll.do_pdf:
            os.chmod(ConfigAll.pdf, 0o0444)
    except OSError:
        remove_outputs_if_exist()
        print('{0}: exiting because of errors'.format(sys.argv[0]), file=sys.stderr)
        sys.exit(1)

    # do pdf reduction
    if ConfigAll.do_pdfred:
        t = tempfile.NamedTemporaryFile()
        # LanguageLevel=2 is the default
        system_check_output(['pdf2ps', '-dLanguageLevel=3', ConfigAll.pdf, t.name])
        os.unlink(ConfigAll.pdf)
        system_check_output(['ps2pdf', t.name, ConfigAll.pdf])

    # do linearization
    if ConfigAll.do_qpdf:
        # delete=False since we are going to move the file
        t = tempfile.NamedTemporaryFile(delete=False)
        system_check_output(['qpdf', '--linearize', ConfigAll.pdf, t.name])
        os.unlink(ConfigAll.pdf)
        shutil.move(t.name, ConfigAll.pdf)

    # remove the postscript file if need be or chmod it
    if os.path.isfile(ConfigAll.ps):
        if ConfigAll.unlink_ps:
            os.unlink(ConfigAll.ps)
        else:
            os.chmod(ConfigAll.ps, 0o0444)

    # chmod the pdf file
    if os.path.isfile(ConfigAll.pdf):
        os.chmod(ConfigAll.pdf, 0o0444)


@register_main()
def main():
    """
    Run the lilypond wrapper
    :return:
    """
    config_arg_parse_and_launch()


if __name__ == '__main__':
    main()
