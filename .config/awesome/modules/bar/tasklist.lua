local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___                        
  / _ )/ _ | / _ \                       
 / _  / __ |/ , _/                       
/____/_/_|_/_/|_|__ ____   ______________
/_  __/ _ | / __/ //_/ /  /  _/ __/_  __/
 / / / __ |_\ \/ ,< / /___/ /_\ \  / /   
/_/ /_/ |_/___/_/|_/____/___/___/ /_/    
    
--]]--------------------------------------------------------

--[[--------------------------------------------------------

BAR TASKLIST

--]]--------------------------------------------------------

return function(scr) 

    return modules.new(scr, 4, "#00000000", nil, 0, 0, 0, 0, nil, 0, beautiful.rounded_modules, awful.widget.tasklist {

        screen   = scr,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = require("keys.mouse").tasklist_mouse(),
        layout = { max_widget_size = 250, layout = wibox.layout.flex.horizontal },
        widget_template = {
            {
                {
                    {
                        {{ id = 'icon_role', widget = wibox.widget.imagebox }, margins = 2, widget = wibox.container.margin},
                        { id = 'text_role', widget = wibox.widget.textbox },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    valign = 'center',
                    halign = 'center',
                    widget = wibox.container.place,
                },
                top = 2,
                bottom = 2,
                left  = 8,
                right = 16,
                widget = wibox.container.margin,
            },
            id     = 'background_role',
            widget = wibox.container.background,
        }

    })

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------