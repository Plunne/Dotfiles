local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

--[[
   ___  ___   _  ________         
  / _ \/ _ | / |/ / __/ /         
 / ___/ __ |/    / _// /__        
/_/_ /_/_|_/_/|_/___/____/ _______
 / / / / _ \/_  __/  _/  |/  / __/
/ /_/ / ___/ / / _/ // /|_/ / _/  
\____/_/    /_/ /___/_/  /_/___/  

--]]

--[[--------------------------------------------------------
        UPTIME
--]]--------------------------------------------------------

return wibox.widget {
    {
        font = beautiful.panel_uptime_font,
        align = 'center',
        valign = 'center',
        widget = awful.widget.watch('uptime -p' , 0.1)
    },
    fg = beautiful.fg_panel_uptime,
    widget = wibox.container.background
}

-- EOF
