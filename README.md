# PLUNNE DOTFILES

There are my AwesomeWM dotfiles.

![](https://raw.githubusercontent.com/Plunne/Dotfiles/screenshots/DotsDualPreview.png)

[Screenshots here.](https://github.com/Plunne/Dotfiles/tree/screenshots)

# TABLE OF CONTENT
- [PLUNNE DOTFILES](#plunne-dotfiles)
- [TABLE OF CONTENT](#table-of-content)
- [Softwares I use](#softwares-i-use)
- [Environment](#environment)
- [Features](#features)
	- [AwesomeWM](#awesomewm)
	- [BetterDiscord](#betterdiscord)
	- [Firefox](#firefox)
	- [Picom](#picom)
	- [Rofi](#rofi)
	- [Terminal](#terminal)
		- [Simple Terminal](#simple-terminal)
		- [Ranger](#ranger)
		- [Zsh](#zsh)
	- [Zathura](#zathura)
- [Installation](#installation)
- [Thanks to](#thanks-to)

# Softwares I use

- **Terminal** : Konsole
- **Editor** : VSCode
- **Filemanager** : Dolphin & Ranger
- **Web browser** : Firefox
- **PDF Reader** :Zathura
- **Screenshots** : Flameshot

# Environment

- **WM** : AwesomeWM (Git version)
- **Bar** :
- **Keybinds** :
- **Compositor** :Picom (Jonaburg fork)
- **Launcher** : Rofi
- **Notifications** :
- **Wallpaper** :

# Features

There are some features you will have with my config.

## AwesomeWM

- Pretty simple modular configuration (easier than i3!)
- 2 themes (Dark/Light)
- Beautiful title bars
- Volume/Brightness popup
- Calendar/Date/Powermenu popup panel
- Useful top bar with an awesome integration with titlebars
- Light and fast, no animations, everything for performance with a great look
- Easy way to find active window with a little line under title bars which acts like KDE
- All theming properties in one file.
- Notifications
- Tagsklist (Taglist with Tasklist for each desktop)
- Rounder corners except in fullscreen/monowindow

## BetterDiscord

- Feather theme base on Spectra theme
    - Rounded avatars
    - Top server list

## Firefox

- Feather theme available as Firefox extension (Plunne Dark/Light).
- DuckDuckGo Feather theme.
- NightTab Feather theme.

## Picom

- Transparency support
- Little animations when switching windows order

## Rofi

- Drun
- Window switcher
- Shell commands
- Emojis finder

## Terminal

### Simple Terminal

- Feather theme
- Ligatures
- Transparency
- Cursor blinking and dynamic color
- Vertical bar
- Clipboard

### Ranger

- Ueberzug (Image displayer)

### Zsh

- Plunne aliases
- Powerlevel10k
- OhMyZsh

## Zathura

- Feather Theme Switcher
  
# Installation

- 1. Clone this repo and go to =Dotfiles= directory.
```sh
git clone https://github.com/Plunne/Dotfiles ~/.github/Dotfiles
cd .github/Dotfiles
```

- 2. Check the `Makefile` and `install.sh` and change something you want. *(Work In Progress...)* 

- 3. Install yay
```sh
./install.sh yay
```

- 4. Run the `Makefile`
```sh
make all
```

- 5. Run the shell script `install.sh`
```sh
./install.sh
```

- 6. Check the monitors settings in `.script/monitors.sh` and `.config/awesome/vars.lua` .

- 7. Reboot your system.

- 8. Enjoy!

# Thanks to

**ImalouArt** : An awesome artist that made the [My Little Pony wallpaper](https://twitter.com/ImalouArt/status/1470128516410847232) and allowed me to use it.
- **Twitter** : https://twitter.com/ImalouArt
- **Ko-fi** : https://ko-fi.com/imalou

**BetterDiscord theming**
- **Spectra (for awesome betterdiscord theme editor)** : https://github.com/codedotspectra/themes
- **Spectra's theme editor that i used** : https://limeshark.dev/editor/Nocturnal

**People that helped me.**
- **Siduck76 (for awesome nvim tips)** : https://github.com/siduck76/neovim-dotfiles

**People that inspired me.**
- **Elenapan** : https://github.com/elenapan/dotfiles
- **JavaCafe01** : https://github.com/JavaCafe01/dotfiles
- **Many others from the Unixporn community.**

Thanks you for watching/using my dots, have nice moments with my config! <3