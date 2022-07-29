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

l = awful.layout.suit

--[[--------------------------------------------------------
        LAYOUTS
--]]--------------------------------------------------------

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

function rules_All()
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

function rules_Titlebars(bool)
    ruled.client.append_rule {
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = bool }
    }
end

function rules_NoTitlebars(apps)
    ruled.client.append_rule {
        rule_any = { class = apps },
        properties = { titlebars_enabled = false }
    }
end

function rules_Single(app, props)
    ruled.client.append_rule {
        rule = { class = app },
        properties = props
    }
end

function rules_Multiple(apps, props)
    ruled.client.append_rule {
        rule_any = { class = apps },
        properties = props
    }
end

--[[--------------------------------------------------------
        AUTOSTART
--]]--------------------------------------------------------

-- Daemons
function run_daemons(daemons)

    for app = 1, #daemons do
        awful.spawn.single_instance(daemons[app], awful.rules.rules)
    end
end

-- Apps
function run(myapp, mytag)
    awful.spawn.single_instance( myapp, { tag = mytag } ) 
end
