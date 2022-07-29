local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")

--[[--------------------------------------------------------
   ___  ___   ___                   
  / _ )/ _ | / _ \                  
 / _  / __ |/ , _/                  
/____/_/_|_/_/|_|__   ______________
/_  __/ _ |/ ___/ /  /  _/ __/_  __/
 / / / __ / (_ / /___/ /_\ \  / /   
/_/ /_/ |_\___/____/___/___/ /_/    
  
--]]--------------------------------------------------------

local function taglist(scr) 

    return modules.new(scr, 4, beautiful.taglist_bg, nil, 1, 1, 1, 1, beautiful.taglist_border, 1, beautiful.rounded_modules, awful.widget.taglist {
        
        screen = scr,
        filter = awful.widget.taglist.filter.noempty,
        buttons = require("keys.mouse").taglist_mouse()

    })

end

return taglist
