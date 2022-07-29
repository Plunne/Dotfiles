local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[

██████╗  █████╗ ███╗   ██╗███████╗██╗     
██╔══██╗██╔══██╗████╗  ██║██╔════╝██║     
██████╔╝███████║██╔██╗ ██║█████╗  ██║     
██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║     
██║     ██║  ██║██║ ╚████║███████╗███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

--]]
local M = {}

M.left = wibox.widget {
	bg = "#000000",
	ontop = true,
	visible = false,
	x = 0,
	y = 0,
	forced_width = 1920,
	forced_height = 1080,
	widget = wibox.container.background
}

M.right = wibox.widget {
	bg = "#000000",
	ontop = true,
	visible = false,
	x = 3840,
	y = 0,
	forced_width = 1920,
	forced_height = 1080,
	widget = wibox.container.background
}

return awful.popup {

    widget = {
        {
            M.left,
            M.right,
            layout = wibox.layout.fixed.horizontal,
        },
        widget = wibox.container.margin(self, 0, 0, 0, 0),
    },
    bg = "#000000",
    ontop = true,
    visible = false,
    x = 0,
    y = 0,
}
