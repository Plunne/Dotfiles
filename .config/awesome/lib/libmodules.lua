local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

-- Cairo
local cairo = require("lgi").cairo
local img = cairo.ImageSurface.create(cairo.Format.ARGB32, 50, 50) -- Create a surface
local cr  = cairo.Context(img) -- Create a context

--[[--------------------------------------------------------
   __   _ __     __  _______  ___  __  ____   ________
  / /  (_) /    /  |/  / __ \/ _ \/ / / / /  / __/ __/
 / /__/ / _ \  / /|_/ / /_/ / // / /_/ / /__/ _/_\ \  
/____/_/_.__/ /_/  /_/\____/____/\____/____/___/___/  
       
--]]--------------------------------------------------------

local modules = {}

--[[--------------------------------------------------------

SHAPES

--]]--------------------------------------------------------

modules.circle = function()
    return function(cr, w, h) return gears.shape.circle(cr, w, h) end
end

modules.rounded = function(round)
    return function(cr, w, h) return gears.shape.rounded_rect(cr, w, h, round) end
end

--[[--------------------------------------------------------

MODULES

--]]--------------------------------------------------------

modules.new = function(scr, margin_bar, module_bg, module_fg, l, r, t, b, border_col, border_w, round, module_widget)
    
    return wibox.widget {

        screen = scr,
        {   
            {
                module_widget,
                widget = wibox.container.margin(self, l, r, t, b),
            },
            bg = module_bg,
            fg = module_fg,
            shape = modules.rounded(round),
            shape_clip = true,
            shape_border_width = border_w,
            shape_border_color = border_col,
            widget = wibox.container.background
        },
        left = margin_bar * 0.75,
        right = margin_bar * 0.75,
        top = margin_bar,
        bottom = margin_bar,
        widget = wibox.container.margin
    }
end

modules.new_dual = function(scr, module_color, border_color, module_icon, bg_icon, fg_icon, module_text, bg_text, fg_text, shortcuts)

    return modules.new(scr, 4, module_color, nil, 0, 0, 0, 0, border_color, 1, beautiful.rounded_modules,
    wibox.widget {
        modules.new(scr, 1, bg_icon, fg_icon, 6, 0, 0, 0, nil, 0, beautiful.rounded_modules, module_icon),
        modules.new(scr, 1, bg_text, fg_text, 6, 6, 0, 0, nil, 0, beautiful.rounded_modules, module_text),
        buttons = shortcuts,
        layout  = wibox.layout.align.horizontal
    })

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return modules