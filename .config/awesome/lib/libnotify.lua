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

notify.update_progressbar = function(w, out)
    local val = tonumber(out)
    w.value = val
end

--[[--------------------------------------------------------

MODULES

--]]--------------------------------------------------------

-- Set icon
notify.set_icon = function(cmd) 
    return awful.widget.watch('sh -c \'' .. cmd .. '\'', 0.1, function(widget, stdout) widget:set_text(stdout:gsub("[\n]+$", "")) end)
end

-- Set level
notify.set_level = function(cmd)
    return awful.widget.watch('sh -c \'' .. cmd .. '\'', 0.1, function(widget, stdout) widget:set_text(stdout:gsub("[\n]+$", "")) end)
end

-- Set progress bar
notify.set_bar = function(cmd)

    local bar = wibox.widget {
        color               = beautiful.fg_notify_middle_bar,
        background_color    = beautiful.bg_notify_middle_bar,
        max_value           = 100,
        value               = 30,
        forced_height       = beautiful.notify_bar_size,
        forced_width        = 170,
        shape               = modules.rounded(beautiful.notify_bar_rounded),
        bar_shape           = modules.rounded(beautiful.notify_bar_rounded),
        widget = wibox.widget.progressbar
    }
    awful.widget.watch('sh -c \''..cmd..'\'', 0.1, function(_, stdout) notify.update_progressbar(bar, stdout:gsub("[\n]+$", "")) end)

    return bar
end

--[[--------------------------------------------------------

NOTIFY

--]]--------------------------------------------------------

-- Middle
notify.middle = function(icon, num, bar)
    
    return awful.popup {
        screen = awful.screen.focused(),
        fg = beautiful.fg_notify_middle,
        bg = beautiful.bg_notify_middle,
        ontop = true,
        visible = false,
        shape = beautiful.notification_shape,
        placement = awful.placement.centered,
        widget = {
            {
                {
                    {
                        font = beautiful.notify_icon_font,
                        align = 'center',
                        valign = 'center',
                        widget = icon
                    },
                    widget = wibox.container.margin(self, 14, -30, 0, 0),
                },
                bar,
                {
                    font = beautiful.notify_text_font,
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