#!/bin/sh

function get_status {
    playerctl status
}

function get_artist {
    playerctl metadata --format "{{ artist }}"
}

function get_title {
    playerctl metadata --format "{{ title }}"
}

function get_song {
    playerctl metadata --format "{{ artist }} - {{ title }}"
}

status=`get_status`
artist=`get_artist`
title=`get_title`
song=`get_song`

if [ "$status" = "Playing"]; then
    icon="契"
else
    icon=""
fi

case $1 in
    status)
	    echo -n "$icon "
    ;;
    artist)
        echo -n "$artist"
    ;;
    title)
        echo -n "$title"
    ;;
    song)
        echo -n "$song"
    ;;
esac

