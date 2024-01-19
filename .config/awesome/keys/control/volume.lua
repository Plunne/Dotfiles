local awful = require("awful")
local notivol = require("modules.notify.notivol")

--[[
  _________  _  ___________  ____  __ 
 / ___/ __ \/ |/ /_  __/ _ \/ __ \/ / 
/ /__/ /_/ /    / / / / , _/ /_/ / /__
\___/\____/_/|_/ /_/_/_/|_|\____/____/
 | | / / __ \/ /  / / / /  |/  / __/  
 | |/ / /_/ / /__/ /_/ / /|_/ / _/    
 |___/\____/____/\____/_/  /_/___/    

 --]]

require("vars")

local volume = {}

--[[--------------------------------------------------------

FUNCTIONS

--]]--------------------------------------------------------

volume.up = function()

    awful.spawn.with_shell(volume_up)
    notivol.up()

end

volume.down = function()

    awful.spawn.with_shell(volume_down)
    notivol.down()

end

volume.toggle = function()

    awful.spawn.with_shell(volume_toggle)
    notivol.toggle()

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return volume
