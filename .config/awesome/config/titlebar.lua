local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

--[[--------------------------------------------------------

████████╗██╗████████╗██╗     ███████╗██████╗  █████╗ ██████╗ 
╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝██╔══██╗██╔══██╗██╔══██╗
   ██║   ██║   ██║   ██║     █████╗  ██████╔╝███████║██████╔╝
   ██║   ██║   ██║   ██║     ██╔══╝  ██╔══██╗██╔══██║██╔══██╗
   ██║   ██║   ██║   ███████╗███████╗██████╔╝██║  ██║██║  ██║
   ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
    
--]]--------------------------------------------------------

require("lib.libkeys")

local b = awful.titlebar.widget

client.connect_signal("request::titlebars", function(c)

    -- Titlebar title
    local window_title = { 
        align  = "center",
        widget = b.titlewidget(c)
    }

    -- Titlebar Buttons
    local move_window = {
        click(left_click, function() c:activate { context = "titlebar", action = "mouse_move"  } end ),
        click(right_click, function() c:activate { context = "titlebar", action = "mouse_resize"} end )
    }
    
    -- Bottom line
    local bottom_line = wibox.container.margin()
    bottom_line.bottom = 1
    c:connect_signal("property::active", function() bottom_line.color = c.active and beautiful.titlebar_line_focus or beautiful.titlebar_line_normal end )
    
    -- Widgets
    bottom_line.widget = wibox.widget {
        
        wibox.widget {
            --------------------
            --      Left      --
            --------------------
            {   b.ontopbutton(c),
                layout  = wibox.layout.fixed.horizontal
            },
            --------------------
            --     Middle     --
            --------------------
            {   window_title,
                buttons = move_window,
                layout  = wibox.layout.flex.horizontal
            },
            --------------------
            --      Right     --
            --------------------
            {   b.minimizebutton(c), b.floatingbutton(c), b.closebutton(c),
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.align.horizontal
        },
        widget = wibox.container.margin(self, beautiful.titlebar_hmargin, beautiful.titlebar_hmargin, beautiful.titlebar_vmargin, beautiful.titlebar_vmargin)
    }

    awful.titlebar(c, {size=beautiful.titlebar_size}).widget = bottom_line

end)
