#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

echo "=== Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3 -V 2>&1 >> ~/.i3/logfile
