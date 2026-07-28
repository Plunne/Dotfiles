#!/bin/sh
polkit-kde-authentication-agent-1 &
# polkit-gnome-authentication-agent-1 &
/home/plunne/.scripts/monitors.sh triple &
exec awesome
