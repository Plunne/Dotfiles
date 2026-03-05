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

    return modules.new(scr,
    	beautiful.tasklist_bar_gap,
		"#00000000",
		nil,
		0, 0, 0, 0,
		nil,
		0,
		beautiful.tasklist_rounded,
		awful.widget.tasklist
		{
			screen   = scr,
			filter   = awful.widget.tasklist.filter.currenttags,
			buttons  = require("keys.mouse").tasklist_mouse(),
			base_layout = {
				spacing = beautiful.tasklist_bar_spacing,
				layout = wibox.layout.flex.horizontal,
			},
			widget_template = {
				{
					{
						{
							{
								{ id = 'icon_role', widget = wibox.widget.imagebox },
								margins = { left = beautiful.tasklist_icon_spacing },
								widget = wibox.container.margin
							},
							{
								{ id = 'text_role', widget = wibox.widget.textbox },
								margins = { left = beautiful.tasklist_text_spacing },
								widget = wibox.container.margin
							},
							layout = wibox.layout.fixed.horizontal,
						},
						valign = 'center',
						halign = beautiful.tasklist_alignment,
						forced_width = beautiful.tasklist_max_size,
						widget = wibox.container.place,
					},
					top = beautiful.tasklist_margin_top,
					bottom = beautiful.tasklist_margin_bottom,
					left  = beautiful.tasklist_margin_left,
					right = beautiful.tasklist_margin_right,
					widget = wibox.container.margin,
				},
				id     = 'background_role',
				widget = wibox.container.background,
			}
		}
    )

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
