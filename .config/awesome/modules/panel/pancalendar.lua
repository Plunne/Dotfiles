local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[
   ___  ___   _  ________                 
  / _ \/ _ | / |/ / __/ /                 
 / ___/ __ |/    / _// /__                
/_/__/_/_|_/_/|_/___/____/____  ___   ___ 
 / ___/ _ | / /  / __/ |/ / _ \/ _ | / _ \
/ /__/ __ |/ /__/ _//    / // / __ |/ , _/
\___/_/ |_/____/___/_/|_/____/_/ |_/_/|_| 

--]]

--[[--------------------------------------------------------
        STYLES
--]]--------------------------------------------------------

local styles = {}

styles.month   = {}

styles.header  = {  fg_color = beautiful.fg_panel_calendar_header,
                    markup   = function(t) return '<span font="'.. beautiful.panel_calendar_header_font .. '">' .. t .. '</span>' end,
}

styles.weekday = {  fg_color = beautiful.fg_panel_calendar_weekday,
                    markup   = function(t) return '<span font="'.. beautiful.panel_calendar_weekday_font .. '"> ' .. t .. ' </span>' end,
}

styles.normal  = {  markup   = function(t) return '<span font="'.. beautiful.panel_calendar_normal_font .. '"> ' .. t .. ' </span>' end,
}

styles.focus   = {  fg_color = beautiful.fg_panel_calendar_focus,
                    bg_color = beautiful.bg_panel_calendar_focus,
                    markup   = function(t) return '<span font="'.. beautiful.panel_calendar_focus_font .. '"> ' .. t .. ' </span>' end,
                    shape    = modules.circle()
}

--[[--------------------------------------------------------
        DECORATE
--]]--------------------------------------------------------

local function decorate_cell(widget, flag, date)

    if flag=="monthheader" and not styles.monthheader then
        flag = "header"
    end

    local props = styles[flag] or {}

    if props.markup and widget.get_text and widget.set_markup then
        widget:set_markup(props.markup(widget:get_text()))
    end

    -- Change bg color for weekends
    local d = { year=date.year, month=(date.month or 1), day=(date.day or 1) }
    local weekday = tonumber(os.date("%w", os.time(d)))
    local default_fg = (weekday==0 or weekday==6) and beautiful.fg_panel_calendar_weekend or beautiful.fg_panel_calendar_week

    local ret = wibox.widget {
        {
            widget,
            margins = (props.padding or 2) + (props.border_width or 0),
            widget  = wibox.container.margin
        },
        shape        = props.shape,
        border_color = props.border_color or beautiful.color_darker_transparent,
        border_width = props.border_width or 0,
        fg           = props.fg_color or default_fg,
        bg           = props.bg_color or "#00000000",
        widget       = wibox.container.background
    }
    return ret
end

--[[--------------------------------------------------------
        RETURN
--]]--------------------------------------------------------

return wibox.widget {
    date     = os.date("*t"),
    fn_embed = decorate_cell,
    widget   = wibox.widget.calendar.month
}

-- EOF
