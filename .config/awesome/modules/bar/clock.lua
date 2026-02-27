local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[--------------------------------------------------------
   ___  ___   ___           
  / _ )/ _ | / _ \          
 / _  / __ |/ , _/          
/____/_/_|_/_/|_| _______ __
 / ___/ /  / __ \/ ___/ //_/
/ /__/ /__/ /_/ / /__/ ,<   
\___/____/\____/\___/_/|_|  
   
--]]--------------------------------------------------------

local clock_hour = wibox.widget
{ 
	format 	= '<span foreground="' .. beautiful.clock_hour_fg .. '">' .. beautiful.clock_hour_format .. '</span>',
	font 	= beautiful.clock_hour_font,
	refresh = 1,
	buttons = require("keys.mouse").panel_mouse(),
	widget 	= wibox.widget.textclock
}

local clock_minutes = wibox.widget
{ 
		format 	= '<span foreground="' .. beautiful.clock_minutes_fg .. '">' .. beautiful.clock_minutes_format .. '</span>',
		font 	= beautiful.clock_minutes_font,
		refresh = 1,
		buttons = require("keys.mouse").panel_mouse(),
		widget 	= wibox.widget.textclock
}

local clock_seconds = wibox.widget
{ 
		format 	= '<span foreground="' .. beautiful.clock_seconds_fg .. '">' .. beautiful.clock_seconds_format .. '</span>',
		font 	= beautiful.clock_seconds_font,
		refresh = 1,
		buttons = require("keys.mouse").panel_mouse(),
		widget 	= wibox.widget.textclock
}

local clock_am_pm = wibox.widget
{ 
		format 	= '<span foreground="' .. beautiful.clock_am_pm_fg .. '">' .. beautiful.clock_am_pm_format .. '</span>',
		font 	= beautiful.clock_am_pm_font,
		refresh = 1,
		buttons = require("keys.mouse").panel_mouse(),
		widget 	= wibox.widget.textclock
}

local clock_sep = wibox.widget
{
		format 	= '<span foreground="' .. beautiful.clock_sep_fg .. '">' .. beautiful.clock_sep_format .. '</span>',
		font 	= beautiful.clock_sep_font,
		refresh = 1,
		buttons = require("keys.mouse").panel_mouse(),
		widget 	= wibox.widget.textclock
}

--[[--------------------------------------------------------

BAR CLOCK

--]]--------------------------------------------------------

return function(scr)

    return modules.new(
	    scr,
	    beautiful.clock_bar_gap,
	    nil,
	    beautiful.fg_modules_clock,
	    6, 6, 0, 0,
	    nil,
	    0,
	    0,
		{
	    	clock_hour,
			clock_sep,
			clock_minutes,
			clock_am_pm,
			layout = wibox.layout.align.horizontal,
		}
	)
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
