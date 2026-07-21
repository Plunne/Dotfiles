#!/bin/sh
#  _____  _                                     
# |  __ \| |                                    
# | |__) | |_   _ _ __  _ __   ___              
# |  ___/| | | | | '_ \| '_ \ / _ \             
# | |    | | |_| | | | | | | |  __/             
# |_|___ |_|\__,_|_| |_|_| |_|\___|       _     
# |_   _|         | |      | | |         | |    
#   | |  _ __  ___| |_ __ _| | |      ___| |__  
#   | | | '_ \/ __| __/ _` | | |     / __| '_ \ 
#  _| |_| | | \__ \ || (_| | | |  _  \__ \ | | |
# |_____|_| |_|___/\__\__,_|_|_| (_) |___/_| |_|
#
# creator : Lena aka Plunne
# more infos : https://gitlab.com/Plunne/plunne_dotfiles
#
# Everyone can use and edit this file #ShareYourCode <3
#________________________________________________________#

#################
#     Setup     #
#################

setup() {
    misc_fnkeys
	misc_dolphinOpenWith
	p10k
    dotfiles
    install_apps
}

#################
#     Miscs     #
#################

misc_fnkeys() {
	echo -e "\n***** MISC FN KEYS *****"
	sudo sh -c "echo options hid_apple fnmode=2 > /etc/modprobe.d/hid_apple.conf"
	sudo sh -c "sed -i 's/FILES=()/FILES=(\/etc\/modprobe.d\/hid_apple.conf)/g' /etc/mkinitcpio.conf"
	sudo mkinitcpio -p linux-lts
}

misc_dolphinOpenWith() {
    echo -e "\n***** MISC DOLPHIN OPEN WITH *****"
    mkdir $HOME/.config/menus/
    curl -L https://raw.githubusercontent.com/KDE/plasma-workspace/master/menu/desktop/plasma-applications.menu -o $HOME/.config/menus/applications.menu
    # run kbuildsycoca6
}

################
#     P10K     #
################

p10k() {
	echo -e "\n***** INSTALL P10K *****\n"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

####################
#     Dotfiles     #
####################

dotfiles() {
    cp -rvpf ~/Dotfiles/. ~
	echo "dotfiles are copied"
}

####################
#       Apps   	   #
####################

install_apps() {
    ~/.scripts/apps.sh
    echo "apps installed"
}


#################
#     Clean     #
#################

clean() {
    rm -rf ~/install.sh
    rm -rf ~/README.md
}

################
#     MAIN     #
################

case $1 in
    setup)
        setup
    ;;
    fnkeys)
        misc_fnkeys
    ;;
	dolphin)
		misc_dolphinOpenWith
    ;;
	p10k)
		p10k
	;;
    dots)
        dotfiles
    ;;
    apps)
        install_apps
    ;;
    clean)
        clean
    ;;
esac

# EOF
