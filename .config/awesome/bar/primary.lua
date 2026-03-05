local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

--[[--------------------------------------------------------

██████╗ ██████╗ ██╗███╗   ███╗ █████╗ ██████╗ ██╗   ██╗
██╔══██╗██╔══██╗██║████╗ ████║██╔══██╗██╔══██╗╚██╗ ██╔╝
██████╔╝██████╔╝██║██╔████╔██║███████║██████╔╝ ╚████╔╝ 
██╔═══╝ ██╔══██╗██║██║╚██╔╝██║██╔══██║██╔══██╗  ╚██╔╝  
██║     ██║  ██║██║██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   
╚═╝     ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
                                                       
--]]--------------------------------------------------------

return function(scr)

    -- Modules
    local layoutbox = require("modules.bar.layoutbox")(scr)
    local taglist = require("modules.bar.taglist")(scr)
    local tasklist = require("modules.bar.tasklist")(scr)
    local tagsklist = require("modules.bar.tagsklist")(scr)
    local memory = require("modules.bar.memory")(scr)
    local volume = require("modules.bar.volume")(scr)
    local light = require("modules.bar.brightness")(scr)
    local date = require("modules.bar.date")(scr)
    local systray = require("modules.bar.systray")(scr)
    local clock = require("modules.bar.clock")(scr)
    local launcher = require("modules.bar.launcher")(scr)

    -------------------
    --     PANEL     --
    -------------------

    return awful.wibar {

        screen = scr,
        position = "top",
        height = beautiful.bar_size,
        bg = beautiful.bar_bg,
        widget = { 

            layout = wibox.layout.align.horizontal,

            -------------------------
            --     Left widgets    --
            -------------------------
            {   layout = wibox.layout.fixed.horizontal,
                layoutbox,
                tagsklist,
            },
            -------------------------
            --    Middle widgets   --
            -------------------------   
            {   layout = wibox.layout.fixed.horizontal,   
                tasklist,
				buttons = require("keys.mouse").bar_mouse(),
            },
            -------------------------
            --    Right widgets    --
            -------------------------
            {   layout = wibox.layout.fixed.horizontal,
                memory,
                volume,
                date,
                clock,
                systray,
                launcher,
            }
        }
    }
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
