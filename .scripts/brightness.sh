#!/bin/sh

###############
#     Set     #
###############

function bright_up {
    brightnessctl set 5%+
}

function bright_down {
    brightnessctl set 5%-
}

###############
#     Get     #
###############

function get_brightness {
    brightnessctl get
}

######################
#     Brightness     #
######################

brightness=`get_brightness`

if [ "$brightness" = "0" ]; then
    icon_text=" "
    level_text="$brightness%"
else    
    if [  "$brightness" -lt "33" ]; then
        icon_text=" "
        level_name="$brightness%"
    else
        if [ "$brightness" -lt "66" ]; then
            icon_text=" "
            level_text="$brightness%"
        else
            icon_text=" "
            level_text="$brightness%"
        fi
    fi
fi

case $1 in
    icon)
	echo "$icon_text"
    	;;
    level)
        echo "$level_text"
	;;
    num)
        echo "$brightness"
	;;
    up)
        bright_up
	;;
    down)
        bright_down
	;;
esac

# EOF
