local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")

--[[--------------------------------------------------------
   _  ______  ________________  __
  / |/ / __ \/_  __/  _/ __/\ \/ /
 /    / /_/ / / / _/ // _/   \  / 
/_/|_/\____/ /_/ /___/_/     /_/  

--]]--------------------------------------------------------

require("vars")

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule        = { },
        properties  = {
            screen           = screen[screen2],
            implicit_timeout = 5,
            margin = beautiful.notification_margin,
            max_width = beautiful.notification_max_width,
        }
    }

end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)
