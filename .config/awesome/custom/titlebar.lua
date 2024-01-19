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

local titlebar = awful.titlebar.widget

client.connect_signal("request::titlebars", function(c)

    -- Titlebar title
    local window_title = { 
        align  = "center",
        widget = titlebar.titlewidget(c)
    }

    -- Titlebar Buttons
    local window_buttons = {
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
            {
                titlebar.ontopbutton(c),
                layout  = wibox.layout.fixed.horizontal
            },
            --------------------
            --     Middle     --
            --------------------
            {
                window_title,
                buttons = window_buttons,
                layout  = wibox.layout.flex.horizontal
            },
            --------------------
            --      Right     --
            --------------------
            {
                titlebar.minimizebutton(c), titlebar.floatingbutton(c), titlebar.closebutton(c),
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.align.horizontal
        },
        widget = wibox.container.margin(self, beautiful.titlebar_hmargin, beautiful.titlebar_hmargin, beautiful.titlebar_vmargin, beautiful.titlebar_vmargin)
    }

    awful.titlebar(c, {size=beautiful.titlebar_size}).widget = bottom_line

end)
