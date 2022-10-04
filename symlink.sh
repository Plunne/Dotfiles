#!/bin/sh

link() {
	rm -rf $1
	ln -s ~/$1 $1
}

unlink() {
	real_dir="$(realpath $PWD/$1)"
	rm $PWD/$1
	cp -LR "$real_dir" $PWD/$1
}

tabDots=(\
#config
.config/awesome \
.config/BetterDiscord \
.config/firefox \
.config/flameshot \
.config/neofetch \
.config/nvim \
.config/OpenTabletDriver \
.config/qalculate \
.config/ranger \
.config/rofi \
.config/spicetify \
.config/st \
.config/xfce4 \
.config/zathura \
.config/zsh \
.config/kritarc \
.config/picom.conf \
#emacs
.emacs.d/lisp \
.emacs.d/snippets \
.emacs.d/themes \
.emacs.d/config.org \
.emacs.d/init.el \
.emacs.d/README.org \
#icons
.icons \
#local
.local/share/applications/emacsclient.desktop \
.local/share/applications/emacsdaemon.desktop \
.local/share/applications/emacsinit.desktop \
.local/share/fonts \
#scripts
.scripts \
#themes
.themes \
#wallpapers
.wallpapers \
#home
.p10k.zsh \
.xinitrc \
.Xressources \
.zprofile \
.zshenv \
.zshrc
)

lenDots=${#tabDots[@]}

link_dots() {
	for ((i=0; i<$lenDots; i++)); do
		link ${tabDots[i]};
	done
}

unlink_dots() {
	for ((i=0; i<$lenDots; i++)); do
		unlink ${tabDots[i]};
	done
}

case $1 in
	-l)
		link $2
		;;
	-u)
		unlink $2
		;;
    -ld)
        link_dots
		;;
    -ud)
        unlink_dots
		;;
    -r)
		link_dots
        unlink_dots
		;;
esac
