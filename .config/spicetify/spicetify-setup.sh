#!/bin/sh

installTheme() {
	spicetify config extensions dribbblish.js
	spicetify config current_theme Dribbblish
}

setTheme() {
	spicetify config color_scheme $1
	spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
	spicetify apply
}

case $1 in
	install)
		installTheme
		;;
	dark)
        setTheme feather-dark
        ;;
	light)
        setTheme feather-light
        ;;
esac
