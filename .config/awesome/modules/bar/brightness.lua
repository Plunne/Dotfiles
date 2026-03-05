local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___                                 
  / _ )/ _ | / _ \                                
 / _  / __ |/ , _/                                
/____/_/_|_/_/|_|_______ _________  ______________
  / _ )/ _ \/  _/ ___/ // /_  __/ |/ / __/ __/ __/
 / _  / , _// // (_ / _  / / / /    / _/_\ \_\ \  
/____/_/|_/___/\___/_//_/ /_/ /_/|_/___/___/___/  
 
--]]--------------------------------------------------------

local brightness_icon = awful.widget.watch('sh -c \'~/.scripts/brightness.sh icon\'' , 0.1)
local brightness_text = awful.widget.watch('sh -c \'~/.scripts/brightness.sh level\'' , 0.1)

brightness_icon.font = beautiful.brightness_icon_font
brightness_text.font = beautiful.brightness_text_font

--[[--------------------------------------------------------

BAR BRIGHTNESS

--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
		beautiful.brightness_bar_gap,
        beautiful.brightness_bg,
        beautiful.brightness_icon_bg,
        brightness_icon,
        beautiful.brightness_icon_bg,
        beautiful.brightness_icon_fg,
        brightness_text,
        beautiful.brightness_text_bg,
        beautiful.brightness_text_fg,
        require("keys.mouse").light_mouse())
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
