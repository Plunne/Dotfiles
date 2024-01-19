awful = require("awful")
beautiful = require("beautiful")
ruled = require("ruled")

--[[--------------------------------------------------------
   __   _ __     _________  _  _______________
  / /  (_) /    / ___/ __ \/ |/ / __/  _/ ___/
 / /__/ / _ \  / /__/ /_/ /    / _/_/ // (_ / 
/____/_/_.__/  \___/\____/_/|_/_/ /___/\___/  
  
--]]--------------------------------------------------------

require("vars")

--[[--------------------------------------------------------
        LAYOUTS
--]]--------------------------------------------------------

l = awful.layout.suit

function set_layouts(args)
        awful.layout.append_default_layouts(args)
end

--[[--------------------------------------------------------
        DESKTOPS
--]]--------------------------------------------------------

function add_desktop(name, scr, lay, ratio, gap, sel, icon)
        
    awful.tag.add(
        name,
        {
            screen              = scr,
            layout              = lay,
            master_width_factor = ratio,
            gap_single_client   = gap,
            selected            = sel,
            icon                = icon,
        }
    )

end

--[[--------------------------------------------------------
        RULES
--]]--------------------------------------------------------

rules = {}

rules.All = function()
    ruled.client.append_rule {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = require("keys.keyboard").clientkeys(),
            buttons = require("keys.mouse").clientbuttons(),
            screen = awful.screen.focused,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }
    
end

rules.Titlebars = function(bool)
    ruled.client.append_rule {
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = bool }
    }
end

rules.NoTitlebars = function(apps)
    ruled.client.append_rule {
        rule_any = { class = apps },
        properties = { titlebars_enabled = false }
    }
end

rules.Single = function(app, props)
    ruled.client.append_rule {
        rule = { class = app },
        properties = props
    }
end

rules.Multiple = function(apps, props)
    ruled.client.append_rule {
        rule_any = { class = apps },
        properties = props
    }
end

--[[--------------------------------------------------------
        AUTOSTART
--]]--------------------------------------------------------

run = {}

-- Daemons
run.daemons = function(daemons)

    for app = 1, #daemons do
        awful.spawn.single_instance(daemons[app], awful.rules.rules)
    end
end

-- Apps
run.app = function(myapp, mytag)
    awful.spawn.single_instance( myapp, { tag = mytag } ) 
end

run.sh = function(script)
	awful.spawn.with_shell(script)
end
