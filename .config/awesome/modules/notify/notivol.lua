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
local notivol_icon = notify.get_icon('~/.scripts/volume.sh icon')
local notivol_level = notify.get_level('~/.scripts/volume.sh level')
local notivol_bar = notify.get_slider('~/.scripts/volume.sh num')

-- Notification Module
local noti = notify.middle(notivol_icon, notivol_level, notivol_slider)

-- Init timer
local timer = notify.set_timer(noti, 2)

--[[--------------------------------------------------------

FUNCTIONS

--]]--------------------------------------------------------

notivol.up = function()

    noti.visible = true
    notify.noti_timer(timer)

end

notivol.down = function()

    noti.visible = true
    notify.noti_timer(timer)

end

notivol.toggle = function()

    noti.visible = true
    notify.noti_timer(timer)

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return notivol
