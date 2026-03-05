local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___                          
  / _ )/ _ | / _ \                         
 / _  / __ |/ , _/                         
/____/_/_|_/_/|_|_________________  _______
  / _ \/ _ /_  __/ __/_  __/  _/  |/  / __/
 / // / __ |/ / / _/  / / _/ // /|_/ / _/  
/____/_/ |_/_/ /___/ /_/ /___/_/  /_/___/  
   
--]]--------------------------------------------------------    

local datetime_icon = wibox.widget {
    text   = beautiful.datetime_icon,
    widget = wibox.widget.textbox
}

local datetime_text = wibox.widget {

    format = beautiful.datetime_format,
    refresh = 1,
    widget = wibox.widget.textclock
}

datetime_icon.font = beautiful.datetime_icon_font
datetime_text.font = beautiful.datetime_text_font

--[[--------------------------------------------------------

BAR DATETIME

--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
		beautiful.datetime_bar_gap,
        beautiful.datetime_bg,
        beautiful.datetime_icon_bg,
        datetime_icon,
        beautiful.datetime_icon_bg,
        beautiful.datetime_icon_fg,
        datetime_text,
        beautiful.datetime_text_bg,
        beautiful.datetime_text_fg,
        require("keys.mouse").calentime_mouse())
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
