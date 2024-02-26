#!/bin/zsh
#     ___  __   __  ___  ___  ______  ____  ______ __
#    / _ \/ /  / / / / |/ / |/ / __/ /_  / / __/ // /
#   / ___/ /__/ /_/ /    /    / _/    / /__\ \/ _  / 
#  /_/  /____/\____/_/|_/_/|_/___/   /___/___/_//_/  
#

ZSH_CFG="$HOME/.config/zsh"

source $ZSH_CFG/pkg_arch.zsh
source $ZSH_CFG/git.zsh
source $ZSH_CFG/paths.zsh

# Help
alias plunne='cat "$ZSH_CFG"/help/help.txt'
alias pgit='cat "$ZSH_CFG"/help/git.txt'
alias ppath='cat "$ZSH_CFG"/help/paths.txt'
alias parch='cat "$ZSH_CFG"/help/pkg_arch.txt'
alias pdeb='cat "$ZSH_CFG"/help/pkg_debian.txt'

# General
alias clr='clear'
alias ls='ls -la --color'
alias neo='clear && echo -e "\n" && neofetch'
alias xr='xrdb .Xressources'
alias r='ranger'
alias py='python3'
alias zat='zathura'

# Archives
alias mtar='tar -zcvf' # mtar <archive_compress>
alias utar='tar -zxvf' # utar <archive_decompress> <file_list>
alias z='zip -r' # z <archive_compress> <file_list>
alias uz='unzip' # uz <archive_decompress> -d <dir>

# Editors
alias em='~/.scripts/emacsclient.sh'
alias na='nano'
alias v='nvim'
alias vs='code'
alias suna='sudo nano'
alias suvi='sudo nvim'
alias suvs='sudo code'

# Systemctl
alias sctl='systemctl'
alias sctle='systemctl enable'
alias sctld='systemctl disable'
alias sctls='systemctl status'

# Wired
alias net-h='https://linuxhint.com/arch_linux_network_manager/'
alias net-show='nmcli connection show'
alias net-dev='nmcli device'
alias net-up='nmcli connection up uuid'
alias net-deco='nmcli device disconnect'

# Wi-fi
alias wifi-list='nmcli device wifi list'
alias wifi-co='nmcli device wifi connect' # + <SSID> password <passwd>
alias wifi-on='nmcli radio wifi on'
alias wifi-off='nmcli radio wifi off'