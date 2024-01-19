-- init.lua (System)

return function(scr)

    require("system.errors")
    require("system.wallpaper")(scr)
    require("system.signals")
    require("system.notify")

end