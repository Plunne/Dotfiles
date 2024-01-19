local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")

--[[--------------------------------------------------------
   ___  ___   ___                   
  / _ )/ _ | / _ \                  
 / _  / __ |/ , _/                  
/____/_/_|_/_/|_|  __  ____  _______
 | | / / __ \/ /  / / / /  |/  / __/
 | |/ / /_/ / /__/ /_/ / /|_/ / _/  
 |___/\____/____/\____/_/  /_/___/  
   
--]]--------------------------------------------------------

local volume_icon = awful.widget.watch('sh -c \'~/.scripts/volume.sh icon\'' , 0.1)
local volume_text = awful.widget.watch('sh -c \'~/.scripts/volume.sh level\'' , 0.1)

volume_icon.font = beautiful.modules_volume_icon_font
volume_text.font = beautiful.modules_volume_text_font

--[[--------------------------------------------------------

BAR VOLUME

--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
        beautiful.bg_modules_volume,
        beautiful.border_modules,
        volume_icon,
        beautiful.bg_modules_volume_icon,
        beautiful.fg_modules_volume_icon,
        volume_text,
        beautiful.bg_modules_volume_text,
        beautiful.fg_modules_volume_text,
        require("keys.mouse").volume_mouse())
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------