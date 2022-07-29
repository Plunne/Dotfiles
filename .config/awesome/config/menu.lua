local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

--[[--------------------------------------------------------

███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
       
--]]--------------------------------------------------------

require("vars")

myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}
    
-- Menu items
local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }
local single_reboot = { "reboot", function() os.execute("reboot") end }
local single_shutdown = { "shutdown", function() os.execute("poweroff") end }

mymainmenu = awful.menu({ items = {
    menu_awesome,
    menu_terminal,
    single_reboot,
    single_shutdown 
}})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
