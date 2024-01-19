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

date_icon.font = beautiful.modules_date_icon_font
date_text.font = beautiful.modules_date_text_font

--[[--------------------------------------------------------
        BAR DATE
--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
        beautiful.bg_modules_date,
        beautiful.border_modules,
        date_icon,
        beautiful.bg_modules_date_icon,
        beautiful.fg_modules_date_icon,
        date_text,
        beautiful.bg_modules_date_text,
        beautiful.fg_modules_date_text,
        nil)
    
end