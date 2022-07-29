local beautiful = require("beautiful")
local notify = require("lib.libnotify")

--[[--------------------------------------------------------
   _  ______  ________________  __  
  / |/ / __ \/_  __/  _/ __/\ \/ /  
 /    / /_/ / / / _/ // _/   \  /   
/_/|_/\____/ /_/ /___/_/___  /_/____
 | | / / __ \/ /  / / / /  |/  / __/
 | |/ / /_/ / /__/ /_/ / /|_/ / _/  
 |___/\____/____/\____/_/  /_/___/  
   
--]]--------------------------------------------------------

local notivol = {}

-- Setup modules
local notivol_icon = notify.set_icon('~/.scripts/volume.sh icon')
local notivol_level = notify.set_level('~/.scripts/volume.sh level')
local notivol_bar = notify.set_bar('~/.scripts/volume.sh num')

-- Notification Module
local noti = notify.middle(notivol_icon, notivol_level, notivol_bar)

-- Init timer
local timer = notify.set_timer(noti, 2)

--[[--------------------------------------------------------
        FUNCTIONS
--]]--------------------------------------------------------

function notivol.up()

    noti.visible = true
    notify.noti_timer(timer)

end

function notivol.down()

    noti.visible = true
    notify.noti_timer(timer)

end

function notivol.toggle()

    noti.visible = true
    notify.noti_timer(timer)

end

--[[--------------------------------------------------------
        EOF
--]]--------------------------------------------------------

return notivol
