#!/bin/sh
# /usr/lib/polkit-kde-authentication-agent-1 &
/usr/lib/polkit-gnome-authentication-agent-1 &
/home/plunne/.scripts/monitors.sh vm &
exec awesome
