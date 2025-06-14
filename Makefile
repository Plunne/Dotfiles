#  ____  _                             
# |  _ \| |_   _ _ __  _ __   ___      
# | |_) | | | | | '_ \| '_ \ / _ \     
# |  __/| | |_| | | | | | | |  __/     
# |_|  _|_|\__,_|_| |_|_| |_|\___|     
# |  \/  | __ _| | _____ / _(_) | ___  
# | |\/| |/ _` | |/ / _ \ |_| | |/ _ \ 
# | |  | | (_| |   <  __/  _| | |  __/ 
# |_|  |_|\__,_|_|\_\___|_| |_|_|\___| 
#
# creator : Lena aka Plunne
# more infos : https://github.com/Plunne/Dotfiles
#
# Everyone can use and edit this file #ShareYourCode <3
#________________________________________________________#

############################
#     PACKAGES MANAGER     #
############################

PkgInstall = yay -S
PkgUpdate = sudo pacman -Syu

########################
#     APPLICATIONS     #
########################

# Main Apps
Terminal = konsole
Editor = less emacs visual-studio-code-bin
Browser = firefox
FM_CLI = ranger rofi-emoji ueberzug
FM_GUI = dolphin dolphin-plugins kde-cli-tools kompare archlinux-xdg-menu
FileManager = $(FM_CLI) $(FM_GUI)
Archiver = ark
#PdfViewer = zathura zathura-pdf-poppler
MusicPlayer = elisa
ImageViewer = gwenview #sxiv
VideoViewer = vlc
Screenshot = flameshot dbus
MAIN_APPS = \
	+= $(Terminal) \
	+= $(Editor) \
	+= $(Browser) \
	+= $(FileManager) \
	+= $(Archiver) \
	+= $(PdfViewer) \
	+= $(VideoViewer) \
	+= $(Screenshot)

# System
Sysinfos = neofetch
Sysmonitor = htop
Audio = alsa-utils pulseaudio pulseaudio-alsa playerctl
Archives = gzip zip unzip unrar
Filetypes = gvfs exfat-utils ntfs-3g cifs-utils udiskie kio-fuse
Network = network-manager-applet net-tools samba smbclient
Polkit = polkit-kde-agent kio-admin
Printer = cups cups-pdf system-config-printer brother-mfc-j6920dw lib32-glibc
SYSTEM = \
	+= $(Sysinfos) \
	+= $(Sysmonitor) \
	+= $(Audio) \
	+= $(Archives) \
	+= $(Filetypes) \
	+= $(Network) \
	+= $(Polkit) \
	+= $(Printer)

# Softwares
Office = libreoffice-still
GFX = krita
VFX = kdenlive
SOFTWARES = $(Office) $(GFX) $(VFX)

# Dev
AVR = avr-gcc avr-libc avrdude avr-gdb # (Personnal because I'm programming AVR uControlers)
Arduino = arduino
Kicad = kicad kicad-library kicad-library-3d
QtCreator = qtcreator qt6-doc qt6-examples qt6-base qt6-tools # I Love Qt
Python = python-pip ipython
STM32 = arm-none-eabi-gcc arm-none-eabi-gdb arm-none-eabi-binutils arm-none-eabi-newlib stlink
DEV = $(AVR) $(Arduino) $(Kicad) $(QtCreator) $(Python) $(STM32)

# Misc
MISC = discord spotify github-cli

#####################
#     VARIABLES     #
#####################

# All packages to install
ALL = $(MAIN_APPS) $(SYSTEM) $(SOFTWARES) $(DEV) $(MISC)

########################
#     INSTALLATION     #
########################

all: update wm install

.PHONY: all

update:
	$(PkgUpdate)

install:
	$(PkgInstall) $(ALL)

##############
#     WM     #
##############


wm: xorg awesome

# Xorg
xorg:
	$(PkgInstall) xf86-video-amdgpu xorg-server xorg-xinit xorg-xrandr xsel lxappearance qt6ct-kde breeze breeze-gtk breeze-icons

# Window Managers
awesome:
	$(PkgInstall) awesome-git picom

bspwm:
	$(PkgInstall) bspwm sxhkd bsp-layout man-db picom-jonaburg-git polybar dunst rofi

##################
#     LAPTOP     #
##################

laptop:
	$(PkgInstall) brightnessctl acpi
