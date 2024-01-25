#!/bin/sh
/usr/lib/polkit-kde-authentication-agent-1 &
sh ~/.scripts/monitors.sh
exec awesome