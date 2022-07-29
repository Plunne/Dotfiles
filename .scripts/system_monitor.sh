#!/bin/sh

function mem_usage {
    free --mega | grep 'Mem:' | head -n 1 | awk '{print $3}'
}

memory=`mem_usage`

case $1 in
    ram)
        echo $memory"M"
        ;;
esac
