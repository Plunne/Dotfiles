local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local modules = require("lib.libmodules")

--[[--------------------------------------------------------
   ______________  _____   __   ____
  / __/  _/ ___/ |/ / _ | / /  / __/
 _\ \_/ // (_ /    / __ |/ /___\ \  
/___/___/\___/_/|_/_/ |_/____/___/  

--]]--------------------------------------------------------

--[[--------------------------------------------------------

CLIENTS

--]]--------------------------------------------------------

client.connect_signal("manage", function (c)

    -- Set the windows at the slave,
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

end)

--[[--------------------------------------------------------

TITLEBARS

--]]--------------------------------------------------------

-- Dynamic titlebars
client.connect_signal("focus", 		function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", 	function(c) c.border_color = beautiful.border_normal end)

-- Titlebar setup
require("custom.titlebar")

--[[--------------------------------------------------------

WINDOWS

--]]--------------------------------------------------------

-- Windows corners
local function set_corners_radius(c,r)
	c.shape = modules.rounded(r)
end

local function set_window_corners(c)
	if c.floating and not c.fullscreen and not c.maximized then
		set_corners_radius(c, 8)
	else
		set_corners_radius(c, 0)
	end
end

client.connect_signal("property::fullscreen",	function(c) set_window_corners(c) end)
client.connect_signal("property::maximized", 	function(c) set_window_corners(c) end)
client.connect_signal("property::floating", 	function(c) set_window_corners(c) end)

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------