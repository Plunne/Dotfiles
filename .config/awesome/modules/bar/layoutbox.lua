local awful = require("awful")
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
        BAR LAUNCHER
--]]--------------------------------------------------------

return function(scr)
    
    return modules.new(scr, 4, nil, nil, 4, 0, 2, 2, nil, 0, 0, awful.widget.layoutbox {
        
        screen = scr,
        buttons = {
            click(left_click,   function () awful.layout.inc( 1) end),
            click(right_click,  function () awful.layout.inc(-1) end),
            click(scroll_up,    function () awful.layout.inc(-1) end),
            click(scroll_down,  function () awful.layout.inc( 1) end)
        }

    })

end