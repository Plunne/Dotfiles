local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   __   _ __     _  ______  ________________  __
  / /  (_) /    / |/ / __ \/_  __/  _/ __/\ \/ /
 / /__/ / _ \  /    / /_/ / / / _/ // _/   \  / 
/____/_/_.__/ /_/|_/\____/ /_/ /___/_/     /_/  
     
--]]--------------------------------------------------------

local notify = {}

--[[--------------------------------------------------------

TIMER

--]]--------------------------------------------------------

notify.set_timer = function(noti, time)
    return gears.timer {
        timeout = time,
        callback = function()
            noti.visible = false
        end
    }
end

notify.noti_timer = function(timer)
    if timer.started then
		timer:again()
	else
		timer:start()
	end
end

--[[--------------------------------------------------------

UPDATE PROGRESSBAR

--]]--------------------------------------------------------

notify.update_slider = function(w, out)
    local val = tonumber(out)
    w.value = val
end

--[[--------------------------------------------------------

MODULES

--]]--------------------------------------------------------

-- Get icon
notify.get_icon = function(cmd) 
    return awful.widget.watch('sh -c \'' .. cmd .. '\'', 0.1, function(widget, stdout) widget:set_text(stdout:gsub("[\n]+$", "")) end)
end

-- Get level
notify.get_level = function(cmd)
    return awful.widget.watch('sh -c \'' .. cmd .. '\'', 0.1, function(widget, stdout) widget:set_text(stdout:gsub("[\n]+$", "")) end)
end

-- Get slider
notify.get_slider = function(cmd)

    local slider = wibox.widget {
        color               = beautiful.notify_slider_fg,
        background_color    = beautiful.notify_slider_bg,
        max_value           = 100,
        value               = 30,
        forced_height       = beautiful.notify_slider_height,
        forced_width        = beautiful.notify_slider_width,
        shape               = modules.rounded(beautiful.notify_slider_rounded),
        bar_shape           = modules.rounded(beautiful.notify_slider_rounded),
        widget = wibox.widget.progressbar
    }
    awful.widget.watch('sh -c \''..cmd..'\'', 0.1, function(_, stdout) notify.update_slider(slider, stdout:gsub("[\n]+$", "")) end)

    return slider
end

--[[--------------------------------------------------------

NOTIFY

--]]--------------------------------------------------------

-- Middle
notify.middle = function(icon, num, slider)
    
    return awful.popup {
        screen = awful.screen.focused(),
        fg = beautiful.notify_fg,
        bg = beautiful.notify_bg,
        ontop = true,
        visible = false,
        shape = beautiful.notify_shape,
        placement = awful.placement.centered,
        widget = {
            {
                {
                    {
                        font = beautiful.notify_icon_font,
						fg = beautiful.notify_icon_fg,
						bg = beautiful.notify_icon_bg,
                        align = 'center',
                        valign = 'center',
                        widget = icon
                    },
                    widget = wibox.container.margin(self, 14, -30, 0, 0),
                },
                slider,
                {
                    font = beautiful.notify_text_font,
					fg = beautiful.notify_text_fg,
					bg = beautiful.notify_text_bg,
                    align = 'center',
                    valign = 'center',
                    widget = num
                },
                spacing = 4,
                layout = wibox.layout.fixed.vertical,
            },
            widget = wibox.container.margin(self, 30, 30, 4, 4),
        }
    }
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return notify
