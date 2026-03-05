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

local calendar = require("modules.popup.popcalendar")
local clock = require("modules.popup.popclock")
local uptime = require("modules.popup.popuptime")
local powermenu = require("modules.popup.poppowermenu")

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
		bg = beautiful.panel_bg,
		placement = function(w)
			awful.placement.top_right(w, {
				parent = awful.screen.focused(),
				offset = {
					x = -(beautiful.useless_gap * 2),
					y = (beautiful.useless_gap * 2) + beautiful.bar_size
				}
			}
		)end,
		ontop = true,
		visible = false,
		shape = modules.rounded(beautiful.panel_rounded)

}

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
