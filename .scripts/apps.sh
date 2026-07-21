#!/bin/sh

########################
#
# Applications
#
########################

install_calculatine() {
    git clone https://github.com/Plunne/Calculatine.git ~/.config/Calculatine
    cd ~/.config/Calculatine/os/linux
    ./calculatine.sh
}

install_nvim() {
    cd ~/.config/nvim
    sudo make install
}

install_betterdiscord() {
	cd ~/.local/share/applications
	./BetterDiscord-Linux.AppImage
}

########################
#
# Install
#
########################

install_calculatine
# install_nvim
# install_betterdiscord
