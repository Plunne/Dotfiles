--[[ rc.lua

██████╗  ██████╗       ██╗     ██╗   ██╗ █████╗ 
██╔══██╗██╔════╝       ██║     ██║   ██║██╔══██╗
██████╔╝██║            ██║     ██║   ██║███████║
██╔══██╗██║            ██║     ██║   ██║██╔══██║
██║  ██║╚██████╗    ██╗███████╗╚██████╔╝██║  ██║
╚═╝  ╚═╝ ╚═════╝    ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

--]]-- by Lena SAVY-LARIGALDIE aka Plunne

require("vars")

--[[--------------------------------------------------------

IMPORT MODULES

Import all modules that are required for the config.

--]]--------------------------------------------------------

pcall(require, "luarocks.loader")                               -- LUAROCKS : Needed
require("awful.autofocus")                                      -- AUTOFOCUS : Focus windows when created
require("beautiful").init("~/.config/awesome/themes/" .. theme_name .. "/theme.lua")  -- THEME : Set theme path
require("system")(s)                                            -- SYSTEM : Loads system
require("keys")                                                 -- KEYS : Loads keybindings
require("lib.libconfig")                                        -- CONFIG : Loads config library

--[[--------------------------------------------------------

DAEMONS

Set daemons initialisations at startup : `run.deamons({deamon1, deamons2})`

--]]--------------------------------------------------------

run.daemons({
    "picom",
    "udiskie",
    "nm-applet",
    "flameshot",
    "xrdb .Xressources",
    "sh -c ~/.apps/OpenTabletDriver/bin/OpenTabletDriver.Daemon",
    "XDG_MENU_PREFIX=arch- kbuildsycoca6 --noincremental"
})

--[[--------------------------------------------------------

LAYOUTS

Uncomment the layouts you want to use.

--]]--------------------------------------------------------

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

--[[--------------------------------------------------------

DESKTOPS

To set a desktop use : `add_desktop(name, screen, layout, ratio, gap, selected, icon_path)`

--]]--------------------------------------------------------

add_desktop(" 1 ",  screen1,    l.tile,         0.5,    false,  true,   nil)
add_desktop(" 2 ",  screen1,    l.tile,         0.6,    false,  false,  nil)
add_desktop(" 3 ",  screen1,    l.tile,         0.6,    false,  false,  nil)
add_desktop(" 4 ",  screen2,    l.max,          0.7,    false,  true,   nil)
add_desktop(" 5 ",  screen2,    l.tile,         0.6,    false,  false,  nil)
add_desktop(" 6 ",  screen2,    l.tile,         0.5,    false,  false,  nil)
add_desktop(" 7 ",  screen3,    l.tile,         0.5,    false,  false,  nil)
add_desktop(" 8 ",  screen3,    l.tile,         0.5,    false,  false,  nil)
add_desktop(" 9 ",  screen3,    l.max,          0.5,    false,  true,   nil)

--[[--------------------------------------------------------

RULES

Needed for generic rules : `rules.All()`
Enable/Disable default titlebars : `rules.Titlebars(bool)`
Disable titlebars for some apps : `rules.NoTitlebars(apps)`
Apply some rules for a single app : `rules.Single(app, props)`
Apply some rules for multiple apps : `rules.Multiple(apps, props)`

--]]--------------------------------------------------------

rules.All()
rules.Titlebars(true)
rules.NoTitlebars({"firefox", "LibreWolf", "codium", "discord", "Spotify", "spotify", "Ankama Launcher", "com-ankamagames-wakfu-client-WakfuClient"})
rules.Multiple({"arandr", "Qalculate-gtk"}, { floating = true })
rules.Multiple({"discord", "Spotify", "spotify"}, { screen = screen3 })

--[[--------------------------------------------------------

AUTOSTART

Launch app at startup : `run.app(myapp, mytag)`

--]]--------------------------------------------------------

run.app("firefox", " 4 ")
run.app("discord", " 9 ")
-- run_sh("~/.scripts/emacsdaemon.sh")

--[[--------------------------------------------------------

BARS

Load bars for each screens.

--]]--------------------------------------------------------

require("bar.primary")      (screen[screen1])
require("bar.secondary")    (screen[screen2])
require("bar.secondary")    (screen[screen3])