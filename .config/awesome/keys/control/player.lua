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

FUNCTIONS

--]]--------------------------------------------------------

player.play_pause = function()

    awful.spawn.with_shell(player_toggle)

end

player.next = function()

    awful.spawn.with_shell(player_next)

end

player.prev = function()

    awful.spawn.with_shell(player_prev)

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return player