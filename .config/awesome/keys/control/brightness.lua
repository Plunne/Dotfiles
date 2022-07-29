local awful = require("awful")
local notibright = require("modules.notify.notibright")

--[[
  _________  _  ___________  ____  __             
 / ___/ __ \/ |/ /_  __/ _ \/ __ \/ /             
/ /__/ /_/ /    / / / / , _/ /_/ / /__            
\___/\____/_/|_/_/_/_/_/|_|\____/____/____________
  / _ )/ _ \/  _/ ___/ // /_  __/ |/ / __/ __/ __/
 / _  / , _// // (_ / _  / / / /    / _/_\ \_\ \  
/____/_/|_/___/\___/_//_/ /_/ /_/|_/___/___/___/  

--]]

require("vars")

local brightness = {}

--[[--------------------------------------------------------
        Functions
--]]--------------------------------------------------------

function brightness.up()

    awful.spawn.with_shell(brightness_up)
    notibright.up()

end

function brightness.down()

    awful.spawn.with_shell(brightness_down)
    notibright.down()


end

--[[--------------------------------------------------------
        EOF
--]]--------------------------------------------------------

return brightness
