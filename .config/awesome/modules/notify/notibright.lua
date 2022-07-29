local beautiful = require("beautiful")
local notify = require("lib.libnotify")

--[[--------------------------------------------------------
   _  ______  ________________  __                
  / |/ / __ \/_  __/  _/ __/\ \/ /                
 /    / /_/ / / / _/ // _/   \  /                 
/_/|_/\____/ /_/_/___/_/ ____/_/__  ______________
  / _ )/ _ \/  _/ ___/ // /_  __/ |/ / __/ __/ __/
 / _  / , _// // (_ / _  / / / /    / _/_\ \_\ \  
/____/_/|_/___/\___/_//_/ /_/ /_/|_/___/___/___/  
 
--]]--------------------------------------------------------

local notibright = {}

-- Setup modules
local notibright_icon = notify.set_icon('~/.scripts/brightness.sh icon')
local notibright_level = notify.set_level('~/.scripts/brightness.sh level')
local notibright_bar = notify.set_bar('~/.scripts/brightness.sh num')

-- Notification Module
local noti = notify.middle(notibright_icon, notibright_level, notibright_bar)

-- Init timer
local timer = notify.set_timer(noti, 2)

--[[--------------------------------------------------------
        FUNCTIONS
--]]--------------------------------------------------------

function notibright.up()

    noti.visible = true
    notify.noti_timer(timer)

end

function notibright.down()

    noti.visible = true
    notify.noti_timer(timer)

end

--[[--------------------------------------------------------
        EOF
--]]--------------------------------------------------------

return notibright
