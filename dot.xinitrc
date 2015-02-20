#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Enable zapping (C-A-<Bksp> kills X)
# setxkbmap us -variant colemak -option terminate:ctrl_alt_bksp

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Set up screens and set background
if [ `xrandr | grep -v disconnected | grep -c connected` -eq 2 ]; then # dual-monitor
    if [ `xrandr | grep HDMI1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --output HDMI1 --auto --primary --output eDP1 --auto --left-of HDMI1
    fi
    # if [ `xrandr | grep DVI1 | grep -c ' connected '` -eq 1 ]; then
    #    xrandr --output LVDS1 --auto --primary --output DVI1 --auto --left-of LVDS1
    # fi
else
    xrandr --output eDP1 --auto --primary
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# read in Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -solid "#073642"   # background color
sh ~/.fehbg                 # background image
xset dpms 300               # turn off the screen at 300s
unclutter -idle 1 -root &   # turn off mouse when idle for 1s
urxvtd -q -f -o             # start urxvtd server with current display
twmnd &                     # start tiling window manager notification daemon

echo "=== Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3 -V 2>&1 >> ~/.i3/logfile
