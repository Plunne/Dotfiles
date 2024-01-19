local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

--[[--------------------------------------------------------
  _      _____   __   __   ___  ___   ___  _______ 
 | | /| / / _ | / /  / /  / _ \/ _ | / _ \/ __/ _ \
 | |/ |/ / __ |/ /__/ /__/ ___/ __ |/ ___/ _// , _/
 |__/|__/_/ |_/____/____/_/  /_/ |_/_/  /___/_/|_| 

 --]]--------------------------------------------------------

return function(scr)
    
    if beautiful.wallpaper then
        screen.connect_signal("request::wallpaper", function(scr)
            gears.wallpaper.maximized(beautiful.wallpaper, scr, true)
        end)
    end

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------