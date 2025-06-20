--[[ vars.lua

██╗   ██╗ █████╗ ██████╗ ███████╗       ██╗     ██╗   ██╗ █████╗ 
██║   ██║██╔══██╗██╔══██╗██╔════╝       ██║     ██║   ██║██╔══██╗
██║   ██║███████║██████╔╝███████╗       ██║     ██║   ██║███████║
╚██╗ ██╔╝██╔══██║██╔══██╗╚════██║       ██║     ██║   ██║██╔══██║
 ╚████╔╝ ██║  ██║██║  ██║███████║    ██╗███████╗╚██████╔╝██║  ██║
  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

--]]-- by Lena SAVY-LARIGALDIE aka Plunne

--[[--------------------------------------------------------

THEME

Select the theme by setting this powerful global variable.

--]]--------------------------------------------------------

theme_name = "feather-white"

--[[--------------------------------------------------------        

APPLICATIONS

This section regroup all my custom commands for
differents applications like terminal, file manager, etc.

--]]--------------------------------------------------------

-- Apps
terminal        = "konsole"
browser         = "firefox"
editor          = "~/.scripts/emacsclient.sh"
filemanager     = "dolphin"
editor_cmd      = terminal .. " -e " .. "nvim"
fm_cmd          = terminal .. " -e " .. "ranger"
rofi_launcher   = "rofi -no-lazy-grab -show drun -theme " .. theme_name
rofi_calc       = "rofi -show calc -no-show-match -no-sort -terse -modi calc"
calc            = terminal .. " -e " .. "calculatine"

-- Brightness
brightness_up   = "brightnessctl set 5%+"
brightness_down = "brightnessctl set 5%-"

-- Volume
volume_up       = "amixer sset Master unmute && amixer set Master 2%+"
volume_down     = "amixer sset Master unmute && amixer set Master 2%-"
volume_toggle   = "amixer set Master toggle"

player_toggle   = "playerctl play-pause"
player_next     = "playerctl next"
player_prev     = "playerctl previous"

-- Screenshot
screenshot              = "flameshot screen -n 1 -c -p ~/Screenshots"
screenshot_delay        = "flameshot screen -n 1 -c -p ~/Screenshots -d 3000"
screenshot_region       = "flameshot gui"
screenshot_region_delay = "flameshot gui -d 3000"

--[[--------------------------------------------------------        

MONITORS

I created a variable for each monitor I use.

--]]--------------------------------------------------------

-- Screens that I use
screen1 = "DisplayPort-2"   -- Primary
screen2 = "DVI-D-0"         -- Right
screen3 = "HDMI-A-0"        -- Left

-- Screen that will display notifications
notiscreen = screen3

--[[--------------------------------------------------------        

KEYS

For an easier configuration and better readability, 
I decided to alias some keys in my config.

--]]--------------------------------------------------------        

-- Keys Aliases
modkey  = "Mod4"
altkey  = "Mod1"
enter   = "Return"
space   = "space"
esc     = "Escape"
tab     = "Tab"
print   = "Print"

-- Arrow keys
up      = "Up"
down    = "Down"
left    = "Left"
right   = "Right"

-- Mouse buttons
left_click  = 1
right_click = 3
scroll_up   = 4
scroll_down = 5
