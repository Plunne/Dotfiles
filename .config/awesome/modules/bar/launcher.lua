local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local panel = require("custom.panel")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___                         
  / _ )/ _ | / _ \                        
 / _  / __ |/ , _/                        
/____/_/_|_/_/|_|___  _________ _________ 
  / /  / _ |/ / / / |/ / ___/ // / __/ _ \
 / /__/ __ / /_/ /    / /__/ _  / _// , _/
/____/_/ |_\____/_/|_/\___/_//_/___/_/|_| 
     
--]]--------------------------------------------------------

--[[--------------------------------------------------------

BAR LAUNCHER

--]]--------------------------------------------------------

return function(scr) 

    return modules.new(scr, 4, nil, nil, 0, 4, 2, 2, nil, 0, 4, wibox.widget {

        awful.widget.button {
            screen  = scr,
            image   = beautiful.awesome_icon,
            buttons = { click(left_click, function() panel.visible = not panel.visible end ), nil }
        },
        shape  = modules.rounded(beautiful.rounded_modules),
        shape_clip = true,
        shape_border_color = nil,
        widget = wibox.container.background

    })

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------