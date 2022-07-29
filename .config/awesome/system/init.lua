-- init.lua (System)

local function sys(scr)

    require("system.errors")
    require("system.wallpaper")(scr)
    require("system.signals")
    require("system.notify")

end

return sys
