local awful = require("awful")

--[[--------------------------------------------------------
   __   _ __     __ ________  ______
  / /  (_) /    / //_/ __/\ \/ / __/
 / /__/ / _ \  / ,< / _/   \  /\ \  
/____/_/_.__/ /_/|_/___/   /_/___/  
   
--]]--------------------------------------------------------

require("vars")

--[[--------------------------------------------------------

KEYS COMBINAISONS

--]]--------------------------------------------------------

super   = {modkey,}
alt     = {altkey,}
ctrl    = {"Control",}
shift   = {"Shift",}

super_alt     = {modkey, altkey}
super_ctrl    = {modkey, "Control"}
super_shift   = {modkey, "Shift"}

super_alt_ctrl    = {modkey, altkey, "Control"}
super_alt_shift   = {modkey, altkey, "Shift"}

super_ctrl_shift  = {modkey, "Control", "Shift"}

--[[--------------------------------------------------------

KEYBOARD FUNCTIONS

--]]--------------------------------------------------------

function bind(mod, key, g, d, action)       
    return awful.key( mod, key, action, { description=d, group=g })
end

function bindApp(mod, key, d, app)      
    return awful.key( mod, key, function() awful.spawn.easy_async_with_shell(app) end, { description=d, group="Apps" })
end

function bindCtl(key, d, action)       
    return awful.key( {}, key, action, { description=d, group="Controls" })
end

function bindNum(mod, g, d, action)       
    return awful.key {
        modifiers = mod,
        keygroup = "numrow",
        description = d,
        group = g,
        on_press = action
    }
end

--[[--------------------------------------------------------

MOUSE FUNCTIONS

--]]--------------------------------------------------------

function click(click, action)       
    return awful.button( {}, click, action)
end

function clickMod(mod, click, action)       
    return awful.button( mod, click, action)
end

function clickShell(click, app)      
    return awful.button( {}, click, function() awful.spawn.easy_async_with_shell(app) end )
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------