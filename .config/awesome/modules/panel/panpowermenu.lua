local beautiful = require("beautiful")
local wibox = require("wibox")

--[[
   ___  ___   _  ________                            
  / _ \/ _ | / |/ / __/ /                            
 / ___/ __ |/    / _// /__                           
/_/__/_/_|_/_/|_/___/____/___  __  ________  ____  __
  / _ \/ __ \ | /| / / __/ _ \/  |/  / __/ |/ / / / /
 / ___/ /_/ / |/ |/ / _// , _/ /|_/ / _//    / /_/ / 
/_/   \____/|__/|__/___/_/|_/_/  /_/___/_/|_/\____/  

--]]

require("lib.libkeys")
require("vars")

--[[--------------------------------------------------------

LOGOUT BUTTON

--]]--------------------------------------------------------

local logout_button = wibox.widget {
    markup = '<span foreground="' .. beautiful.fg_panel_powermenu_logout .. '">  </span>',
    font = beautiful.panel_powermenu_logout_font,
    align = 'center',
    valign = 'center',
    buttons = { click(left_click, function() awesome.quit() end) }, 
    widget = wibox.widget.textbox
}

--[[--------------------------------------------------------

RESTART BUTTON

--]]--------------------------------------------------------

local restart_button = wibox.widget {
    markup = '<span foreground="' .. beautiful.fg_panel_powermenu_restart .. '">  </span>',
    font = beautiful.panel_powermenu_restart_font,
    align = 'center',
    valign = 'center',
    buttons = { click(left_click, function() os.execute("reboot") end) }, 
    widget = wibox.widget.textbox
}

--[[--------------------------------------------------------

POWER BUTTON

--]]--------------------------------------------------------

local power_button = wibox.widget {
    markup = '<span foreground="' .. beautiful.fg_panel_powermenu_poweroff .. '">  </span>',
    font = beautiful.panel_powermenu_poweroff_font,
    align = 'center',
    valign = 'center',
    buttons = { click(left_click, function() os.execute("poweroff") end) }, 
    widget = wibox.widget.textbox
}

--[[--------------------------------------------------------

PANPOWERMENU

--]]--------------------------------------------------------

local panpowermenu = wibox.widget {
    logout_button,
    restart_button,
    power_button, 
    layout = wibox.layout.fixed.horizontal
}

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return panpowermenu