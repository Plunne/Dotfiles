local awful = require("awful")

--[[
  _________  _  ___________  ____  __ 
 / ___/ __ \/ |/ /_  __/ _ \/ __ \/ / 
/ /__/ /_/ /    / / / / , _/ /_/ / /__
\___/\____/_/|_/_/_/_/_/|_|\____/____/
  / _ \/ /  / _ \ \/ / __/ _ \        
 / ___/ /__/ __ |\  / _// , _/        
/_/  /____/_/ |_|/_/___/_/|_|         

--]]

require("vars")

local player = {}

--[[--------------------------------------------------------
        Functions
--]]--------------------------------------------------------

function player.play_pause()

    awful.spawn.with_shell(player_toggle)

end

function player.next()

    awful.spawn.with_shell(player_next)

end

function player.prev()

    awful.spawn.with_shell(player_prev)

end

--[[--------------------------------------------------------
        EOF
--]]--------------------------------------------------------

return player
