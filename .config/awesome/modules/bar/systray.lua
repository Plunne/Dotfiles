local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___                    
  / _ )/ _ | / _ \                   
 / _  / __ |/ , _/                   
/____/_/_|_/_/|_|_________  _____  __
  / __/\ \/ / __/_  __/ _ \/ _ \ \/ /
 _\ \   \  /\ \  / / / , _/ __ |\  / 
/___/   /_/___/ /_/ /_/|_/_/ |_|/_/  
   
--]]--------------------------------------------------------

--[[--------------------------------------------------------

BAR SYSTRAY

--]]--------------------------------------------------------

return function(scr)

    local mysystray = wibox.widget.systray()
    mysystray.set_screen(scr)

    return modules.new(scr, 4, beautiful.bg_systray, nil, 8, 8, 4, 4, beautiful.systray_border, 1, beautiful.systray_rounded, mysystray)

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------