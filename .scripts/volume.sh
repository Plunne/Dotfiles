#!/bin/sh

################
#     Mute     #
################

function vol_mute {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
}

function vol_unmute {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
}

function vol_toggle {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

###############
#     Set     #
###############

volume_limit=1.00

function vol_up {
    vol_unmute
    wpctl set-volume -l $volume_limit @DEFAULT_AUDIO_SINK@ 1%+
}

function vol_down {
    vol_unmute
    wpctl set-volume -l $volume_limit @DEFAULT_AUDIO_SINK@ 1%-
}

###############
#     Get     #
###############

function get_volume {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F '.' '{print $2}'
}

function get_muted {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F '[' '{print $2}' | awk -F ']' '{print $1}'
}

function get_full {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ' ' '{print $2}' | awk -F '.' '{print $1}'
}

##################
#     Volume     #
##################

volume=`get_full``get_volume`
muted=`get_muted`
full=`get_full`

if [ "$muted" = "MUTED" ]; then
    icon_text="婢"
    level_text="muted"
else
    if [ "$volume" = "000" ]; then
        icon_text="婢"
        level_text="0%"
    else
	volume=$(sed 's/^0*//' <<< $volume)
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

###################
#     Options     #
###################

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
    up)
        vol_up
    ;;
    down)
        vol_down
    ;;
    toggle)
        vol_toggle
    ;;
esac

# EOF
