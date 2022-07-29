local awful = require("awful")
local beautiful = require("beautiful")

--[[--------------------------------------------------------
   ______________  _____   __   ____
  / __/  _/ ___/ |/ / _ | / /  / __/
 _\ \_/ // (_ /    / __ |/ /___\ \  
/___/___/\___/_/|_/_/ |_/____/___/  

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

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

require("config.titlebar")
