local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___     
  / _ )/ _ | / _ \    
 / _  / __ |/ , _/    
/____/_/_|_/_/|_|_____
  / _ \/ _ /_  __/ __/
 / // / __ |/ / / _/  
/____/_/ |_/_/ /___/  
  
--]]--------------------------------------------------------    

local date_icon = wibox.widget {
    text   = beautiful.date_icon,
    widget = wibox.widget.textbox
}

local date_text = wibox.widget {

    format = beautiful.date_format,
    refresh = 1,
    widget = wibox.widget.textclock
}

date_icon.font = beautiful.date_icon_font
date_text.font = beautiful.date_text_font

--[[--------------------------------------------------------

BAR DATE

--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
		beautiful.date_bar_gap,
        beautiful.date_bg,
        beautiful.date_icon_bg,
        date_icon,
        beautiful.date_icon_bg,
        beautiful.date_icon_fg,
        date_text,
        beautiful.date_text_bg,
        beautiful.date_text_fg,
        require("keys.mouse").calentime_mouse())
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
