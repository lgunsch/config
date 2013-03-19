#!/usr/bin/env python

# Disable mouse:
#     xinput --enable $(xinput list | perl -ne '/Abyssus\s+id=(\d+)/ && print $1')
# Enable mouse:
#     xinput --enable $(xinput list | perl -ne '/Abyssus\s+id=(\d+)/ && print $1')

import argparse
import re
import subprocess
import sys


class BanishException(Exception):
    pass


def get_mouse_id(mouse_name):
    """
    Return the xinput ID of the requested mouse from the regular expression
    mouse_name to match a line in 'xinput list'.
    """
    line_pattern = re.compile(mouse_name)
    id_pattern = re.compile('id=(\d+)')
    output = subprocess.check_output('xinput list', shell=True)

    for line in output.splitlines():
        line_match = line_pattern.match(line)
        if line_match:
            id_match = id_pattern.search(line)
            if id_match:
                id = id_match.group(1)
                break
    else:
        raise BanishException('Mouse not found.')

    return id


def is_enabled(mouse_id):
    pattern = re.compile('\s+Device Enabled \(\d+\):\s+(\d+)')
    output = subprocess.check_output('xinput --list-props %s' % mouse_id,
                                     shell=True)

    for line in output.splitlines():
        match = pattern.match(line)
        if match:
            enabled = match.group(1).strip()
            if enabled == '1':
                return True
            else:
                return False


def set_mouse(enabled, mouse_id):
    action = 'enable' if enabled else 'disable'
    cmd = "xinput --%s %s" % (action, mouse_id)
    status = subprocess.call(cmd, shell=True)
    if status == 0:
        print '%sd mouse %s.' % (action, mouse_id)
    else:
        raise BanishException('Cound not %s the mouse.' % action)


def main():
    parser = argparse.ArgumentParser('Enable/Disable the given mouse.')
    parser.add_argument('mouse_regex',
                        help="Regular expression to find mouse line from "
                             "'xinput list'. Ex: .*Name.*")
    results = parser.parse_args()

    try:
        mouse_id = get_mouse_id(results.mouse_regex)
        enabled = is_enabled(mouse_id)
        set_mouse(not enabled, mouse_id)
    except BanishException as e:
        print >>sys.stderr, e.message
        return 1
    else:
        return 0

if __name__ == '__main__':
    sys.exit(main())
