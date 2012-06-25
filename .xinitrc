#!/bin/sh
#
# ~/.xinitrc
# Executed by startx (run your window manager from here)

# Set up screens and set background
if [ `xrandr | grep -c ' connected '` -eq 2 ]; then # dual-monitor
    if [ `xrandr | grep VGA1 | grep -c ' connected '` -eq 1 ]; then
    xrandr --output LVDS1 --auto --primary --output VGA1 --auto --left-of LVDS1
    fi
    if [ `xrandr | grep DVI1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --output LVDS1 --auto --primary --output DVI1 --auto --left-of LVDS1
    fi
    # xsetroot -solid \#cccccc
    feh --no-xinerama --bg-tile ~/wallpapers/coloured-particles.jpg
else
    xrandr --output LVDS1 --auto --primary --output VGA1 --off --output DVI1 --off
    feh --no-xinerama --bg-tile ~/wallpapers/coloured-particles.jpg
fi

#xbacklight -set 50     # set LCD brightness to 50%
#xsetroot -cursor_name left_ptr
#xmodmap -e "keycode 134 = Multi_key"

# SCIM Setup
#export XMODIFIERS=@im=SCIM
#export GTK_IM_MODULE="scim"

#scim -d 
#mpd ~/.mpd/mpd.conf
#ck-launch-session nm-applet --sm-disable &

# Exec i3
#stalonetray &
#(sleep 1s && conky -c ~/.conkyrc_i3 | dzen2 -bg black -fg white -fn -windows-montecarlo-medium-*-*--11-
#*-*-*-*-*-*-* -p -w 500 -h 18 -x 700 -y 0 -ta r ) & 
#exec ~/i3/i3




# Disable DPMS turning off the screen
xset -dpms
xset s off

# Disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
#setxkbmap us -variant colemak -option terminate:ctrl_alt_bksp
setxkbmap -option terminate:ctrl_alt_bksp

# Enforce correct locales from the beginning
unset LC_COLLATE
export LC_CTYPE=en_CA.UTF-8
export LC_TIME=en_CA.UTF-8
export LC_NUMERIC=en_CA.UTF-8
export LC_MONETARY=en_CA.UTF-8
export LC_MESSAGES=C
export LC_PAPER=en_CA.UTF-8
export LC_NAME=en_CA.UTF-8
export LC_ADDRESS=en_CA.UTF-8
export LC_TELEPHONE=en_CA.UTF-8
export LC_MEASUREMENT=en_CA.UTF-8
export LC_IDENTIFICATION=en_CA.UTF-8

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

# Set background color
xsetroot -solid "#333333"

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3 >> ~/.i3/logfile
#exec /home/lgunsch/workspace/examples/c/tinywm
