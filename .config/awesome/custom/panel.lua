local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------

██████╗  █████╗ ███╗   ██╗███████╗██╗     
██╔══██╗██╔══██╗████╗  ██║██╔════╝██║     
██████╔╝███████║██╔██╗ ██║█████╗  ██║     
██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║     
██║     ██║  ██║██║ ╚████║███████╗███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

--]]--------------------------------------------------------

local calendar = require("modules.panel.pancalendar")
local clock = require("modules.panel.panclock")
local uptime = require("modules.panel.panuptime")
local powermenu = require("modules.panel.panpowermenu")

return awful.popup {

    widget = {
        {
            calendar,
            {
                wibox.container.margin(clock, 30, 28, 20, 0),
                uptime,
                wibox.container.margin(powermenu, 16, 30, 30, 0),
                layout = wibox.layout.fixed.vertical,

            },
            spacing = 30,
            layout = wibox.layout.fixed.horizontal,
        },
        widget = wibox.container.margin(self, 30, 30, 30, 30),
    },
    bg = beautiful.bg_panel,
    ontop = true,
    visible = false,
    x = beautiful.panel_x,
    y = beautiful.panel_y,
    shape = modules.rounded(beautiful.panel_rounded)
}

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------