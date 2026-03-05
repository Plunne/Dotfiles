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
				{
					wibox.container.place(clock, "center"),
					wibox.container.place(uptime, "center"),
					wibox.container.place(calendar, "center"),
					wibox.container.place(powermenu, "center"),
					spacing = 30,
					layout = wibox.layout.fixed.vertical,
				},
				widget = wibox.container.margin(self, 54, 54, 60, 60),
			},
			top = 1,
			-- left = 1,
			color = beautiful.modules_border,
			widget = wibox.container.margin,
		},
		-- bg = beautiful.bar_bg,
		placement = function(w)
			awful.placement.maximize_vertically(w)
			awful.placement.right(w, {
				parent = awful.screen.focused(),
				honor_workarea = true,
				offset = { y = beautiful.bar_size }
			}
		)end,
		ontop = true,
		visible = false,
		-- shape = modules.rounded_tl(8)
}

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
