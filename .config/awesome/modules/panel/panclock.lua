local beautiful = require("beautiful")
local wibox = require("wibox")

--[[
   ___  ___   _  ________   
  / _ \/ _ | / |/ / __/ /   
 / ___/ __ |/    / _// /__  
/_/__/_/_|_/_/|_/___/____/__
 / ___/ /  / __ \/ ___/ //_/
/ /__/ /__/ /_/ / /__/ ,<   
\___/____/\____/\___/_/|_|  

--]]

--[[--------------------------------------------------------

HOUR

--]]--------------------------------------------------------

local hour = wibox.widget {
        format = '<span foreground="' .. beautiful.fg_panel_clock_hour .. '">%H</span>',
        font = beautiful.panel_clock_hour_font,
        align = 'center',
        valign = 'center',
        refresh = 1,
        widget = wibox.widget.textclock
}

--[[--------------------------------------------------------

:

--]]--------------------------------------------------------

local sep = wibox.widget {
    markup = '<span foreground="' .. beautiful.fg_panel_clock_sep .. '">:</span>',
    font = beautiful.panel_clock_sep_font,
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

--[[--------------------------------------------------------

MINUTES

--]]--------------------------------------------------------

local min = wibox.widget {
    format = '<span foreground="' .. beautiful.fg_panel_clock_min .. '">%M</span>',
    font = beautiful.panel_clock_min_font,
    refresh = 1,
    widget = wibox.widget.textclock
}

--[[--------------------------------------------------------

PANCLOCK

--]]--------------------------------------------------------

local panclock = wibox.widget {
    hour,
    sep,
    min,
    layout = wibox.layout.fixed.horizontal
}

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return panclock