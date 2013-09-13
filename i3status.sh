#!/bin/bash

# Firt line is the version: print it out.
# Second line is the start of the infinite JSON array, print it out also.
i3status | (read line && echo $line && read line && echo $line && while :
do
	read line
	temp=$(nvidia-smi -q -d TEMPERATURE | grep Gpu | awk '{print $3;}')
	text="[{ \"full_text\": \"GPU: ${temp}°C \" },"
	echo  "${line/[/$text}" || exit 1
done)
