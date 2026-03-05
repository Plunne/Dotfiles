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

volume_icon.font = beautiful.volume_icon_font
volume_text.font = beautiful.volume_text_font

--[[--------------------------------------------------------

BAR VOLUME

--]]--------------------------------------------------------

return function(scr)

    return modules.new_dual(scr,
		beautiful.volume_bar_gap,
        beautiful.volume_bg,
        beautiful.volume_icon_bg,
        volume_icon,
        beautiful.volume_icon_bg,
        beautiful.volume_icon_fg,
        volume_text,
        beautiful.volume_text_bg,
        beautiful.volume_text_fg,
        require("keys.mouse").volume_mouse())
    
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
