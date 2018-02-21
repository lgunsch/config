#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Enable zapping (C-A-<Bksp> kills X)
# setxkbmap us -variant colemak -option terminate:ctrl_alt_bksp -option ctrl:nocaps

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Set up screens and set background
#if [ `xrandr | grep -v disconnected | grep -c connected` -eq 2 ]; then # dual-monitor
#    if [ `xrandr | grep DP1-1 | grep -c ' connected '` -eq 1 ]; then
#        xrandr --output DP1-1 --auto --primary --output eDP1 --auto --left-of DP1-1
#    fi
#    # if [ `xrandr | grep DVI1 | grep -c ' connected '` -eq 1 ]; then
#    #    xrandr --output LVDS1 --auto --primary --output DVI1 --auto --left-of LVDS1
#    # fi
#else
#    xrandr --output eDP1 --auto --primary
#fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# read in Xresources, do not ever background xrdb
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export BROWSER=google-chrome-stable

xset dpms 300               # turn off the screen at 300s
xsetroot -solid "#073642"   # background color
sh ~/.fehbg                 # background image
urxvtd -q -f -o             # start urxvtd server with current display

echo "=== Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3 -V 2>&1 >> ~/.i3/logfile
