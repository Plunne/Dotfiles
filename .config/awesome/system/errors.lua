local naughty = require("naughty")

--[[--------------------------------------------------------
   _______  ___  ____  ___  ____
  / __/ _ \/ _ \/ __ \/ _ \/ __/
 / _// , _/ , _/ /_/ / , _/\ \  
/___/_/|_/_/|_|\____/_/|_/___/  
   
--]]--------------------------------------------------------

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
