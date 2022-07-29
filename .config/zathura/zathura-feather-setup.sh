#!/bin/sh

# Setup Zatura Feather theme
case $1 in
	dark)
        cp zathura-feather-dark zathurarc
        ;;
	light)
        cp zathura-feather-light zathurarc
        ;;
    
esac
