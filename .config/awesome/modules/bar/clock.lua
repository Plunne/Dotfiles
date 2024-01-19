local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___           
  / _ )/ _ | / _ \          
 / _  / __ |/ , _/          
/____/_/_|_/_/|_| _______ __
 / ___/ /  / __ \/ ___/ //_/
/ /__/ /__/ /_/ / /__/ ,<   
\___/____/\____/\___/_/|_|  
   
--]]--------------------------------------------------------

local clock_text = wibox.widget {
 
    format = '%I:%M %p',
    font = beautiful.clock_font,
    refresh = 1,
    widget = wibox.widget.textclock
}

--[[--------------------------------------------------------

BAR CLOCK

--]]--------------------------------------------------------

return function(scr)

    return modules.new(scr, 4, nil, beautiful.fg_modules_clock, 8, 8, 0, 0, nil, 0, 8, clock_text)
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------