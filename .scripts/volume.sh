#!/bin/sh

function get_volume {
    amixer -D pulse get Master | grep '%' | head -n 1 | awk -F'[' '{print $2}' | awk -F'%' '{print $1}'
}

function get_muted {
    amixer -D pulse get Master | grep '%' | head -n 1 | awk -F'[' '{print $3}' | awk -F']' '{print $1}'
}

volume=`get_volume`
muted=`get_muted`

if [ "$muted" = "off" ]; then
    icon_text="婢"
    level_text="muted"
else
    if [ "$volume" = "0" ]; then
        icon_text="婢"
        level_text="$volume%"
    else    
        if [  "$volume" -lt "33" ]; then
            icon_text="奄"
            level_text="$volume%"
        else
            if [ "$volume" -lt "66" ]; then
                icon_text="奔"
                level_text="$volume%"
            else
                icon_text="墳"
                level_text="$volume%"
            fi
        fi
    fi
fi

case $1 in
    icon)
	    echo -n "$icon_text "
    ;;
    level)
        echo -n "$level_text"
	;;
    num)
        echo -n "$volume"
    ;;
esac

