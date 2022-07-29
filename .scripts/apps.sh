#!/bin/sh

apps_dir() {
    cd ~/.apps
}

########################
#
# Applications
#
########################

install_nvim() {
    sudo pacman -S base-devel cmake unzip ninja tree-sitter curl
    git clone https://gitlab.com/Plunne/neovim.git
    cd neovim
    sudo make install
    apps_dir
}

install_st() {
    git clone https://gitlab.com/Plunne/st.git
    cd st
    sudo make install clean
    apps_dir
}

install_spicetify() {
    yay -S spicetify-cli
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    # For spicetify dots, be sure that you changed your username in the
    # prefs_path variable (in .config/spicetify/config-xpui.ini)
}

install_betterdiscord() {
    ./betterdiscord/BetterDiscord-Linux.AppImage
}

########################
#
# Install
#
########################

install_nvim
install_st
install_spicetify
install_betterdiscord
