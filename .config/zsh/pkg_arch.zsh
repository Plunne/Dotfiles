#!/bin/zsh
#     ___  __   __  ___  ___  ______  ____  ______ __
#    / _ \/ /  / / / / |/ / |/ / __/ /_  / / __/ // /
#   / ___/ /__/ /_/ /    /    / _/    / /__\ \/ _  / 
#  /_/  /____/\____/_/|_/_/|_/___/   /___/___/_//_/  
#

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pasyu='sudo pacman -Syu'
alias pas='sudo pacman -S'
alias pau='sudo pacman -U'
alias par='sudo pacman -R'
alias parns='sudo pacman -Rns'
alias pasi='pacman -Si'
alias pass='pacman -Ss'
alias paqi='pacman -Qi'
alias paqs='pacman -Qs'
alias paqdt='sudo pacman -Qdt'
alias pasyy='sudo pacman -Syy'
alias pars='sudo pacman -Rs $(pacman -Qtdq)'
alias pafy='sudo pacman -Fy'
alias paf='pacman -F'
alias paql='pacman -Ql'
alias paqo='pacman -Qo'

# Yay - https://github.com/Jguer/yay
alias yasyu='yay -Syu'
alias yas='yay -S'
alias yau='yay -U'
alias yar='yay -R'
alias yarns='yay -Rns'
alias yasi='yay -Si'
alias yass='yay -Ss'
alias yaqi='yay -Qi'
alias yaqs='yay -Qs'
alias yaqe='yay -Qe'
alias yaqdt='yay -Qtd'
alias yasyy='yay -Syy'
alias yapg='yay -Pg'