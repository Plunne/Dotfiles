local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")

--[[--------------------------------------------------------
   ___  ___   ___                                  
  / _ )/ _ | / _ \                                 
 / _  / __ |/ , _/                                 
/____/_/_|_/_/|_|____  __  ___________  ____  _  __
  / /  / _ \ \/ / __ \/ / / /_  __/ _ )/ __ \| |/_/
 / /__/ __ |\  / /_/ / /_/ / / / / _  / /_/ />  <  
/____/_/ |_|/_/\____/\____/ /_/ /____/\____/_/|_|  
    
--]]--------------------------------------------------------

require("lib.libkeys")

--[[--------------------------------------------------------

BAR LAYOUTBOX

--]]--------------------------------------------------------

return function(scr)
    
    return modules.new(scr,
    	beautiful.layoutbox_bar_gap,
		nil,
		nil,
		beautiful.layoutbox_bar_gap, 0, 1, 1,
		nil,
		0,
		0,
		awful.widget.layoutbox {
			
			screen = scr,
			buttons = {
				click(left_click,   function () awful.layout.inc( 1) end),
				click(right_click,  function () awful.layout.inc(-1) end),
				click(scroll_up,    function () awful.layout.inc(-1) end),
				click(scroll_down,  function () awful.layout.inc( 1) end)
			}

		}
    )

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
