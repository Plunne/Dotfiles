local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___                   
  / _ )/ _ | / _ \                  
 / _  / __ |/ , _/                  
/____/_/_|_/_/|_| _______  _____  __
  /  |/  / __/  |/  / __ \/ _ \ \/ /
 / /|_/ / _// /|_/ / /_/ / , _/\  / 
/_/  /_/___/_/  /_/\____/_/|_| /_/  
    
--]]--------------------------------------------------------

local memory_icon = wibox.widget {
    text   = beautiful.memory_icon,
    widget = wibox.widget.textbox
}

local memory_text = awful.widget.watch('sh -c \'~/.scripts/system_monitor.sh ram\'' , 1)

memory_icon.font = beautiful.memory_icon_font
memory_text.font = beautiful.memory_text_font

--[[--------------------------------------------------------

BAR MEMORY

--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
		beautiful.memory_bar_gap,
        beautiful.memory_bg,
        beautiful.memory_icon_bg,
        memory_icon,
        beautiful.memory_icon_bg,
        beautiful.memory_icon_fg,
        memory_text,
        beautiful.memory_text_bg,
        beautiful.memory_text_fg,
        nil)
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
