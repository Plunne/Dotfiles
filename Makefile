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
Browser = librewolf-bin
FileManager = ranger ueberzug dolphin
Archiver = file-roller
PdfViewer = zathura zathura-pdf-poppler
ImageViewer = sxiv
VideoViewer = haruna
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
Audio = alsa-utils pulseaudio-alsa playerctl
Archives = gzip zip unzip unrar
Filetypes = gvfs exfat-utils ntfs-3g udiskie
Network = net-tools
Printer = cups cups-pdf system-config-printer brother-mfc-j6920dw lib32-glibc
SYSTEM = \
	+= $(Sysinfos) \
	+= $(Sysmonitor) \
	+= $(Audio) \
	+= $(Archives) \
	+= $(Filetypes) \
	+= $(Network) \
	+= $(Printer)

# Softwares
Office = libreoffice-still
GFX = krita
SOFTWARES = $(Office) $(GFX)

# Dev
AVR = avr-gcc avr-libc avrdude avr-gdb # (Personnal because I'm programming AVR uControlers)
Arduino = arduino
Kicad = kicad kicad-library kicad-library-3d
QtCreator = qtcreator qt5-doc qt5-examples qt5-base # I Love Qt
Python = python-pip
STM32 = arm-none-eabi-gcc arm-none-eabi-gdb arm-none-eabi-binutils arm-none-eabi-newlib stlink
DEV = $(AVR) $(Arduino) $(Kicad) $(QtCreator) $(Python) $(STM32)

# Misc
MISC = discord spotify

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
	$(PkgInstall) xf86-video-amdgpu xorg-server xorg-xinit xorg-xrandr xsel lxappearance qt5ct breeze breeze-gtk breeze-icons

# Window Managers
awesome:
	$(PkgInstall) awesome-git picom-jonaburg-git rofi

bspwm:
	$(PkgInstall) bspwm sxhkd bsp-layout man-db picom-jonaburg-git polybar dunst rofi

##################
#     LAPTOP     #
##################

laptop:
	$(PkgInstall) brightnessctl acpi
