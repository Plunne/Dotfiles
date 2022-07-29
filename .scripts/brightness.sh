#!/bin/sh

function brightness {
    brightnessctl get
}

bright=`brightness`


if [ "$bright" = "0" ]; then
    icon_text=" "
    level_text="$bright%"
else    
    if [  "$bright" -lt "33" ]; then
        icon_text=" "
        level_name="$bright%"
    else
        if [ "$bright" -lt "66" ]; then
            icon_text=" "
            level_text="$bright%"
        else
            icon_text=" "
            level_text="$bright%"
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
        echo "$bright"
	;;
esac

