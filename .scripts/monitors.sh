#!/bin/sh
#     __  _______  _  ________________  ___  ____
#    /  |/  / __ \/ |/ /  _/_  __/ __ \/ _ \/ __/
#   / /|_/ / /_/ /    // /  / / / /_/ / , _/\ \  
#  /_/  /_/\____/_/|_/___/ /_/  \____/_/|_/___/  
#

# Displays


Monitor_Main=DisplayPort-2
Monitor_Right=DVI-D-0
Monitor_Left=HDMI-A-0

# Setup


xrandr --output $Monitor_Main --primary --rate 165
xrandr --output $Monitor_Right --right-of $Monitor_Main --rate 144
xrandr --output $Monitor_Left --left-of $Monitor_Main

# Toggle screens (WIP)


turnoff() {
    xrandr --output $Monitor_Right --off
    xrandr --output $Monitor_Left --off
}

turnon() {
    xrandr --output $Monitor_Right --right-of $Monitor_Main --rate 144
    xrandr --output $Monitor_Left --left-of $Monitor_Main
}

case $1 in
    turnoff)
	turnoff
    ;;
    turnon)
	turnon
    ;;
esac
