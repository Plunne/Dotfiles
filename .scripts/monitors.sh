#!/bin/sh
#     __  _______  _  ________________  ___  ____
#    /  |/  / __ \/ |/ /  _/_  __/ __ \/ _ \/ __/
#   / /|_/ / /_/ /    // /  / / / /_/ / , _/\ \  
#  /_/  /_/\____/_/|_/___/ /_/  \____/_/|_/___/  
#

# Displays

Monitor_VM=Virtual-1
Monitor_Main=DisplayPort-0
Monitor_Right=DisplayPort-1
Monitor_Left=HDMI-A-1

# Setup

screen_vm() {
    xrandr --output $Monitor_VM --primary --mode 1920x1080 --rate 60
}

screen_m() {
    xrandr --output $Monitor_Main --primary --rate 165
}

screen_r() {
    xrandr --output $Monitor_Right --right-of $Monitor_Main --rate 144 --rotate right
}

screen_l() {
    xrandr --output $Monitor_Left --left-of $Monitor_Main
}


# Toggle screens (WIP)

sides_off() {
    xrandr --output $Monitor_Right --off
    xrandr --output $Monitor_Left --off
}

sides_on() {
    xrandr --output $Monitor_Right --right-of $Monitor_Main --rate 144
    xrandr --output $Monitor_Left --left-of $Monitor_Main
}

case $1 in
    single)
	screen_m
	;;
    dual_r)
	screen_m && screen_r
	;;
    dual_l)
	screen_m && screen_l
	;;
    triple)
	screen_m && screen_r && screen_l
	;;
    vm)
	screen_vm
	;;
    turnoff)
	sides_off
    	;;
    turnon)
	sides_on
    	;;
    *)
	screen_m
	;;
esac

