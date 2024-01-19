# Plunne's Awesome WM

Hi!

I daily use Awesome WM as my window manager, it's the best for me.

# WHY I CHOSE AWESOME WM?

Awesome WM is the only one that i can get the perfect look at the same time of my workflow.

Generally other window managers don't have the ability to fully customize title bars except Open Box.
But Openbox isn't a dynamic tiling window manager.

Howerver, Awesome also allow me to design my OS entirely with complex modules.
For exemple, I created beautiful rounded modules with different levels of faces. I have rounded rectangles
into other rounded rectangle into a container background. Only Awesome can do that with an implemented
titlebar feature.

To talk about workflow, I have different layouts withs different master window size for different desktops.
Some other window managers like BSPWM (which I am from) can do this but with all of them I don't have
all the above features.

# TABLE OF CONTENT
- [Plunne's Awesome WM](#plunnes-awesome-wm)
- [WHY I CHOSE AWESOME WM?](#why-i-chose-awesome-wm)
- [TABLE OF CONTENT](#table-of-content)
- [VARIABLES](#variables)
  - [Applications](#applications)
  - [Monitors](#monitors)
  - [Keys](#keys)
- [CONFIGURATION](#configuration)
  - [Import modules](#import-modules)
  - [Daemons](#daemons)
  - [Layouts](#layouts)
  - [Desktops](#desktops)
  - [Rules](#rules)
  - [Autostart](#autostart)
  - [Bars](#bars)
- [ORGANISATION](#organisation)

# VARIABLES

I decided to put all my Awesome WM environement variables into `.config/awesome/vars.lua` .

``` lua
--[[

██╗   ██╗ █████╗ ██████╗ ███████╗       ██╗     ██╗   ██╗ █████╗ 
██║   ██║██╔══██╗██╔══██╗██╔════╝       ██║     ██║   ██║██╔══██╗
██║   ██║███████║██████╔╝███████╗       ██║     ██║   ██║███████║
╚██╗ ██╔╝██╔══██║██╔══██╗╚════██║       ██║     ██║   ██║██╔══██║
 ╚████╔╝ ██║  ██║██║  ██║███████║    ██╗███████╗╚██████╔╝██║  ██║
  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

--]]
```

## Applications

This section regroup all my custom commands for differents applications like terminal, file manager, etc.

```lua
-- Apps
terminal        = "konsole"
editor          = "~/.scripts/emacsclient.sh"
filemanager     = "dolphin"
editor_cmd      = terminal .. " -e " .. "nvim"
fm_cmd          = terminal .. " -e " .. "ranger"
rofi_launcher   = "rofi -no-lazy-grab -show drun -theme feather-light"
rofi_calc       = "rofi -show calc -no-show-match -no-sort -terse -modi calc"
calc            = "qalculate-gtk"

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
```

## Monitors

I created a variable for each monitors I use.

```lua
screen1 = "DisplayPort-2"   -- Primary
screen2 = "DVI-D-0"         -- Right
screen3 = "HDMI-A-0"        -- Left
```

## Keys

For an easier configuration and better readability I decided to aliases some keys in my config.

```lua
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
```

# CONFIGURATION

My main configuration file is my `rc.lua` , so I splitted my entire config into many organized files. I call only the
settings functions I made that I need to setup my WM.

```lua
--[[

██████╗  ██████╗       ██╗     ██╗   ██╗ █████╗ 
██╔══██╗██╔════╝       ██║     ██║   ██║██╔══██╗
██████╔╝██║            ██║     ██║   ██║███████║
██╔══██╗██║            ██║     ██║   ██║██╔══██║
██║  ██║╚██████╗    ██╗███████╗╚██████╔╝██║  ██║
╚═╝  ╚═╝ ╚═════╝    ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

--]]
```

## Import modules

Import all modules that are required for the config.

```lua
pcall(require, "luarocks.loader")                               -- LUAROCKS : Needed
require("awful.autofocus")                                      -- AUTOFOCUS : Focus windows when created
require("beautiful").init("~/.config/awesome/themes/feather-light/theme.lua")  -- THEME : Set theme path
require("system")(s)                                            -- SYSTEM : Loads system
require("keys")                                                 -- KEYS : Loads keybindings
require("lib.libconfig")                                        -- CONFIG : Loads config library
```

## Daemons

Set daemons initialisations at startup : `run_deamons({deamon1, deamons2})`

```lua
run_daemons({
    "picom",
    "udiskie",
    "nm-applet",
    "flameshot",
    "xrdb .Xressources",
    "sh -c ~/.apps/OpenTabletDriver/bin/OpenTabletDriver.Daemon",
})
```

## Layouts

 Uncomment the layouts you want to use.

```lua
set_layouts({
    l.floating,
    l.tile,
    --l.tile.left,
    --l.tile.bottom,
    l.tile.top,
    --l.fair,
    --l.fair.horizontal,
    --l.spiral,
    --l.spiral.dwindle,
    l.max,
    --l.max.fullscreen,
    --l.magnifier,
    --l.corner.nw,
    --l.corner.ne,
    --l.corner.sw,
    --l.corner.se,
})
```

## Desktops

 To set a desktop use : `add_desktop(name, screen, layout, ratio, gap, selected, icon_path)`

```lua
add_desktop(" 1/ ",    screen1,    l.tile,         0.5,    false,  true,   nil)
add_desktop(" 2 ",      screen1,    l.tile,         0.6,    false,  false,  nil)
add_desktop(" 3 ",      screen1,    l.tile,         0.6,    false,  false,  nil)
add_desktop(" 4/ ",    screen2,    l.max,          0.7,    false,  true,   nil)
add_desktop(" 5 ",      screen2,    l.tile,         0.6,    false,  false,  nil)
add_desktop(" 6 ",      screen2,    l.tile,         0.5,    false,  false,  nil)
add_desktop(" 7 ",      screen3,    l.tile,         0.5,    false,  false,  nil)
add_desktop(" 8 ",      screen3,    l.tile,         0.5,    false,  false,  nil)
add_desktop(" 9/ ",    screen3,    l.max,          0.5,    false,  true,   nil)
```

## Rules

Needed for generic rules : `rules_All()`
Enable/Disable default titlebars : `rules_Titlebars(bool)`
Disable titlebars for some apps : `rules_NoTitlebars(apps)`
Apply some rules for a single app : `rules_Single(app, props)`
Apply some rules for multiple apps : `rules_Multiple(apps, props)`

```lua
rules_All()
rules_Titlebars(true)
rules_NoTitlebars({"firefox", "LibreWolf", "codium", "discord", "Spotify", "spotify", "Ankama Launcher", "com-ankamagames-wakfu-client-WakfuClient"})
rules_Multiple({"arandr", "Qalculate-gtk", "dolphin"}, { floating = true })
rules_Multiple({"discord", "Spotify", "spotify"}, { screen = screen3 })
```
 
## Autostart

Launch app at startup : `run(myapp, mytag)`

```lua
run("librewolf", " 4/ ")
run("discord", " 9/ ")
run_sh("~/.scripts/emacsdaemon.sh")
```

## Bars

Load bars for each screens.

```lua
require("config.bar1")(screen[screen1])
require("config.bar2")(screen[screen2])
require("config.bar3")(screen[screen3])
```

# ORGANISATION

- **bar :** Bars configurations
- **custom :** Custom modules configurations
- **keys :** Keybindings
- **lib :** Wrapping library
- **modules :** Modules widgets implementations
- **system :** System settings
- **theme :** Theming configuration and icons
