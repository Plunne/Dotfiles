#!/bin/sh

########################
#
# Applications
#
########################

install_calculatine() {
    git clone https://github.com/Plunne/Calculatine.git ~/.config/calculatine
    cd ~/.config/calculatine/os/linux
    ./calculatine.sh
}

install_nvim() {
    sudo pacman -S base-devel cmake unzip ninja tree-sitter curl
    cd ~/.config/nvim
    sudo make install
}

install_ranger() {
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

install_st() {
    git clone https://github.com/Plunne/St.git ~/.config/St
    cd ~/.config/st
    sudo make install clean
}

install_spicetify() {
    yay -S spicetify-cli
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    # For spicetify dots, be sure that you changed your username in the
    # prefs_path variable (in .config/spicetify/config-xpui.ini)
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
install_nvim
install_ranger
#install_st
#install_spicetify
#install_betterdiscord
