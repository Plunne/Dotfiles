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
    zsh
    dotfiles
    install_apps
    clean
}

###############
#     Yay     #
###############

yay() {
	echo -e "\n***** INSTALL YAY *****\n"
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si
    cd ~
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

###############
#     ZSH     #
###############

zsh() {
	echo -e "\n***** INSTALL ZSH *****\n"
	sudo pacman -S zsh
	chsh -s /bin/zsh $USER
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

####################
#     Dotfiles     #
####################

dotfiles() {
    cp -rvpf ~/.gitlab/plunne_dotfiles/. ~
	echo "dotfiles are copied"
}

####################
#       Apps   	   #
####################

install_apps() {
    ~/.apps/apps.sh
	echo "apps installed"
}


#################
#     Clean     #
#################

clean() {
	rm -rf ~/Makefile
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
    yay)
	    yay
    ;;
    sys)
        misc_fnkeys
        zsh
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
