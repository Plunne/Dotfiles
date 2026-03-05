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

--[[--------------------------------------------------------

BAR TAGLIST

--]]--------------------------------------------------------

return function(scr) 

    return modules.new(scr,
    	beautiful.taglist_bar_gap,
		beautiful.taglist_bg,
		nil,
		1, 1, 1, 1,
		beautiful.taglist_border,
		beautiful.taglist_border_size,
		beautiful.taglist_rounded,
		awful.widget.taglist
		{
			screen = scr,
			filter = awful.widget.taglist.filter.noempty,
			buttons = require("keys.mouse").taglist_mouse()
		}
	)
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
