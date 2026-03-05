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

    return modules.new(scr,
    	beautiful.systray_bar_gap,
		beautiful.bg_systray,
		nil,
		beautiful.systray_padding_horizontal,
		beautiful.systray_padding_horizontal,
		beautiful.systray_padding_vertical,
		beautiful.systray_padding_vertical,
		beautiful.systray_border,
		1,
		beautiful.systray_rounded,
		mysystray
    )
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
