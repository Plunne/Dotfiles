local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

--[[--------------------------------------------------------

██████╗  █████╗ ██████╗      ██╗
██╔══██╗██╔══██╗██╔══██╗    ███║
██████╔╝███████║██████╔╝    ╚██║
██╔══██╗██╔══██║██╔══██╗     ██║
██████╔╝██║  ██║██║  ██║     ██║
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝     ╚═╝
   
--]]--------------------------------------------------------

local function bar1(scr)

    -- Modules
    local mylayoutbox = require("modules.bar.layoutbox")(scr)
    local mytaglist = require("modules.bar.taglist")(scr)
    local mytasklist = require("modules.bar.tasklist")(scr)
    local mymemory = require("modules.bar.memory")(scr)
    local myvolume = require("modules.bar.volume")(scr)
    local mylight = require("modules.bar.brightness")(scr)
    local mydate = require("modules.bar.date")(scr)
    local mysystray = require("modules.bar.systray")(scr)
    local myclock = require("modules.bar.clock")(scr)
    local mylauncher = require("modules.bar.launcher")(scr)

    -------------------
    --     PANEL     --
    -------------------

    return awful.wibar {

        screen = scr,
        position = "top",
        height = beautiful.bar_size,
        bg = beautiful.bg_bar,
        widget = { 

            layout = wibox.layout.align.horizontal,

            -------------------------
            --     Left widgets    --
            -------------------------
            {   layout = wibox.layout.fixed.horizontal,
                mylayoutbox,
                mytaglist
            },
            -------------------------
            --    Middle widgets   --
            -------------------------   
            {   layout = wibox.layout.flex.horizontal,   
                mytasklist
            },
            -------------------------
            --    Right widgets    --
            -------------------------
            {   layout = wibox.layout.fixed.horizontal,
                mymemory,
                myvolume,
                --mylight,
                mydate,
                mysystray,
                myclock,
                mylauncher
            }
        }
    }
end

return bar1
