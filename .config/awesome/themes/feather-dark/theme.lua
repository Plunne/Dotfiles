--[[ feather-dark.lua

████████╗██╗  ██╗███████╗███╗   ███╗███████╗
╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
   ██║   ███████║█████╗  ██╔████╔██║█████╗  
   ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
   ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝

--]]-- By Plunne

--[[--------------------------------------------------------

IMPORT MODULES

Import all modules requiered for theming.

--]]--------------------------------------------------------

require("vars")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local modules = require("lib.libmodules")

--[[--------------------------------------------------------

PATHS

Theming paths.

--]]--------------------------------------------------------

local default_path  = gfs.get_themes_dir()
local wall_path     = os.getenv("HOME").."/.wallpapers/"
local theme_path    = os.getenv("HOME").."/.config/awesome/themes/".. theme_name .. "/"
local layouts_path  = theme_path .. "layouts/"
local titlebar_path = theme_path .. "titlebar/"

--[[--------------------------------------------------------

THEME

Theme object instance.

--]]--------------------------------------------------------

local theme = {}

---------------------
--     GENERAL     --
---------------------

-- Wallpaper
theme.wallpaper = wall_path .. "1196934.jpg"

-- Fonts
theme.fontname  = "JetBrainsMono NerdFont " -- let the last space IMPORTANT!
theme.font      = theme.fontname .. 11

-- Config
theme.useless_gap   	= dpi(4)
theme.border_width  	= dpi(0)
theme.rounded_corners	= dpi(8)
theme.maximized_hide_border = true

-- Colors
theme.color01       = "#9783b1"
theme.color02       = "#6c5689"
theme.color03       = "#5e4a77"
theme.color_dark    = "#503f65"
theme.color_darker  = "#342942"
theme.color_black   = "#251d2f"
theme.color_light   = "#c4b8d3"
theme.color_urgent  = "#ff6c6b"
theme.color_orange  = "#da8548"
theme.color_gold    = "#af875f"
theme.color_cherry  = "#d70087"
theme.color_wine  	= "#af0000"
theme.color_olive   = "#98be65"
theme.color_teal   	= "#1abc9c"
theme.color_cyan    = "#7dcfff"
theme.color_dark_transparent    = theme.color_dark .. "e5"
theme.color_darker_transparent  = theme.color_darker .. "e5"
theme.color_black_transparent   = theme.color_black .. "e5"

-- Bar
theme.bar_size  = dpi(38)
theme.bar_bg    = theme.color_darker_transparent

-- Modules
theme.modules_font      	= theme.font
theme.modules_border    	= theme.color_dark_transparent
theme.modules_border_size 	= 1
theme.modules_fg        	= theme.color_light
theme.modules_bg        	= theme.color_black_transparent
theme.modules_text_fg   	= theme.color01
theme.modules_text_bg   	= theme.modules_bg
theme.modules_icon_fg   	= theme.modules_bg
theme.modules_icon_bg   	= theme.modules_border
theme.modules_rounded   	= 38
theme.modules_bar_gap   	= 6

-- Focus
theme.fg_focus      = theme.modules_bg
theme.bg_focus      = theme.color01
theme.fg_normal     = theme.modules_text_fg
theme.bg_normal     = theme.modules_bg
theme.fg_minimize   = theme.modules_border
theme.bg_minimize   = theme.bg_normal
theme.fg_urgent     = theme.color_light
theme.bg_urgent     = theme.color_urgent

------------------------------
--     BAR DUAL MODULES     --
------------------------------

-- Brightness
theme.brightness_icon_font  = theme.modules_font
theme.brightness_icon_fg    = theme.modules_icon_fg
theme.brightness_icon_bg    = theme.modules_icon_bg
theme.brightness_text_font  = theme.modules_font
theme.brightness_text_fg    = theme.color_orange
theme.brightness_text_bg    = theme.modules_text_bg
theme.brightness_bg         = theme.modules_icon_bg
theme.brightness_bar_gap 	= theme.modules_bar_gap

-- Memory
theme.memory_icon 		= "﬙ "
theme.memory_icon_font 	= theme.modules_font
theme.memory_icon_fg    = theme.modules_icon_fg
theme.memory_icon_bg    = theme.modules_icon_bg
theme.memory_text_font 	= theme.modules_font
theme.memory_text_bg    = theme.modules_text_bg
theme.memory_text_fg    = theme.color_cyan
theme.memory_bg         = theme.modules_icon_bg
theme.memory_bar_gap 	= theme.modules_bar_gap

-- Volume
theme.volume_icon_font 	= theme.modules_font
theme.volume_icon_fg    = theme.modules_icon_fg
theme.volume_icon_bg    = theme.modules_icon_bg
theme.volume_text_font  = theme.modules_font
theme.volume_text_fg    = theme.color_olive
theme.volume_text_bg    = theme.modules_text_bg
theme.volume_bg         = theme.modules_icon_bg
theme.volume_bar_gap 	= theme.modules_bar_gap

-- Date
theme.date_icon 		= " "
theme.date_format 		= '%a %d %b'
theme.date_icon_font    = theme.modules_font
theme.date_icon_fg  	= theme.modules_icon_fg
theme.date_icon_bg  	= theme.modules_icon_bg
theme.date_text_font    = theme.modules_font
theme.date_text_fg  	= theme.color_teal
theme.date_text_bg  	= theme.modules_text_bg
theme.date_bg      		= theme.modules_icon_bg
theme.date_bar_gap 		= theme.modules_bar_gap

-- Datetime
theme.datetime_icon 		= " "
theme.datetime_format 		= '%a %d %b - %H:%M'
theme.datetime_icon_font 	= theme.modules_font
theme.datetime_icon_fg  	= theme.modules_icon_fg
theme.datetime_icon_bg  	= theme.modules_icon_bg
theme.datetime_text_font    = theme.modules_font
theme.datetime_text_fg 		= theme.color_cherry
theme.datetime_text_bg  	= theme.modules_text_bg
theme.datetime_bg       	= theme.modules_icon_bg
theme.datetime_bar_gap 		= theme.modules_bar_gap

-----------------------
--     BAR CLOCK     --
-----------------------

theme.clock_font            = "JetBrainsMono NerdFont "
theme.clock_size            = 18
theme.clock_hour_format    	= "%H"
theme.clock_hour_font      	= theme.clock_font .. "ExtraBold " .. theme.clock_size
theme.clock_hour_fg      	= theme.color_light
theme.clock_minutes_format  = "%M"
theme.clock_minutes_font    = theme.clock_font .. "Regular " .. theme.clock_size
theme.clock_minutes_fg    	= theme.color01
theme.clock_seconds_format  = "%S"
theme.clock_seconds_font    = theme.clock_font .. "Regular ".. theme.clock_size
theme.clock_seconds_fg    	= theme.color_light
theme.clock_sep_format    	= ":"
theme.clock_sep_font    	= theme.clock_font .. "ExtraBold " .. 11
theme.clock_sep_fg    		= theme.color_teal
theme.clock_spacing 		= theme.modules_bar_gap
theme.clock_spacing_left 	= theme.clock_spacing
theme.clock_spacing_right 	= theme.clock_spacing
theme.clock_bar_gap 		= theme.modules_bar_gap

-------------------
--     PANEL     --
-------------------

-- Panel
theme.panel_bg      = color_black_transparent
theme.panel_rounded = theme.rounded_corners

-- Calendar
theme.panel_calendar_font           = theme.fontname
theme.panel_calendar_size           = 10
theme.panel_calendar_header_font    = theme.panel_calendar_font .. 16
theme.panel_calendar_header_fg      = theme.color_light
theme.panel_calendar_weekday_font  	= theme.panel_calendar_font .. theme.panel_calendar_size
theme.panel_calendar_weekday_fg    	= theme.color_teal
theme.panel_calendar_normal_font    = theme.panel_calendar_font .. theme.panel_calendar_size
theme.panel_calendar_week_fg        = theme.color01
theme.panel_calendar_weekend_fg     = theme.color02
theme.panel_calendar_focus_font     = theme.panel_calendar_font .. theme.panel_calendar_size
theme.panel_calendar_focus_fg       = theme.color_darker
theme.panel_calendar_focus_bg       = theme.color_teal
theme.panel_calendar_focus_shape    = modules.rounded(4)

-- Clock
theme.panel_clock_font            	= "JetBrainsMono NerdFont "
theme.panel_clock_size            	= 54
theme.panel_clock_hour_font      	= theme.panel_clock_font .. "ExtraBold " .. theme.panel_clock_size
theme.panel_clock_hour_fg      		= theme.color_light
theme.panel_clock_minutes_font    	= theme.panel_clock_font .. "Regular " .. theme.panel_clock_size
theme.panel_clock_minutes_fg    	= theme.color01
theme.panel_clock_sep_font    		= theme.panel_clock_font .. "ExtraBold " .. theme.panel_clock_size
theme.panel_clock_sep_fg    		= theme.color_teal

-- Powermenu
theme.panel_powermenu_font          = theme.fontname .. 32
theme.panel_powermenu_fg            = theme.color01
theme.panel_powermenu_logout_font   = theme.panel_powermenu_font
theme.panel_powermenu_logout_fg     = theme.panel_powermenu_fg
theme.panel_powermenu_restart_font  = theme.panel_powermenu_font
theme.panel_powermenu_restart_fg    = theme.panel_powermenu_fg
theme.panel_powermenu_poweroff_font = theme.panel_powermenu_font
theme.panel_powermenu_poweroff_fg   = theme.color_cherry

-- Uptime
theme.panel_uptime_font = theme.fontname .. 10
theme.panel_uptime_fg   = theme.color02

-------------------------
--     BAR TAGLIST     --
-------------------------

theme.taglist_font          = theme.fontname .. 12
theme.taglist_fg            = theme.fg_normal
theme.taglist_bg            = theme.bg_normal
theme.taglist_fg_focus      = theme.fg_focus
theme.taglist_bg_focus      = theme.bg_focus
theme.taglist_fg_occupied   = theme.taglist_fg
theme.taglist_bg_occupied   = theme.taglist_bg
theme.taglist_fg_empty      = theme.taglist_fg
theme.taglist_bg_empty      = theme.taglist_fg
theme.taglist_fg_urgent     = theme.taglist_fg
theme.taglist_bg_urgent     = theme.taglist_bg
theme.taglist_border        = theme.modules_border
theme.taglist_border_size   = theme.modules_border_size
theme.taglist_rounded       = theme.modules_rounded
theme.taglist_spacing       = dpi(1)
theme.taglist_shape         = modules.rounded(theme.taglist_rounded)
theme.taglist_bar_gap 		= theme.modules_bar_gap

--------------------------
--     BAR TASKLIST     --
--------------------------

theme.tasklist_font         	= theme.fontname .. 10
theme.tasklist_bg           	= theme.color01
theme.tasklist_fg_focus     	= theme.fg_focus
theme.tasklist_bg_focus     	= theme.bg_focus
theme.tasklist_fg_normal    	= theme.fg_normal
theme.tasklist_bg_normal    	= theme.bg_normal
theme.tasklist_fg_minimize  	= theme.fg_minimize
theme.tasklist_bg_minimize  	= theme.bg_minimize
theme.tasklist_fg_urgent    	= theme.color_light
theme.tasklist_bg_urgent    	= theme.modules_bg
theme.tasklist_alignment  		= 'left' -- text alignment : 'center' or 'left'
theme.tasklist_max_size     	= 250
theme.tasklist_rounded 			= 4
theme.tasklist_icon_spacing 	= 4 -- Space between icon and border
theme.tasklist_text_spacing 	= 6 -- Space between text and icon
theme.tasklist_margin_top 		= theme.modules_bar_gap
theme.tasklist_margin_bottom 	= theme.tasklist_margin_top
theme.tasklist_margin_left 		= theme.modules_bar_gap
theme.tasklist_margin_right 	= theme.tasklist_margin_left
theme.tasklist_spacing 			= dpi(theme.modules_bar_gap) -- Linked to Tagsklist
theme.tasklist_shape        				= modules.rounded(theme.tasklist_rounded)
theme.tasklist_shape_border_width           = dpi(1)
theme.tasklist_shape_border_color           = theme.modules_border
theme.tasklist_shape_border_color_focus     = theme.modules_border
theme.tasklist_shape_border_color_minimized = theme.modules_border
theme.tasklist_bar_gap 			= 4

---------------------------
--     BAR TAGSKLIST     --
---------------------------

theme.tagsklist_bg      		= theme.bg_normal
theme.tagsklist_border  		= theme.modules_border
theme.tagsklist_border_size  	= theme.modules_border_size
theme.tagsklist_rounded 		= theme.modules_rounded
theme.tagsklist_tag_margin   	= 12
theme.tagsklist_tasks_padding 	= -6
theme.tagsklist_icons_padding_horizontal = 0
theme.tagsklist_icons_padding_vertical = 2
theme.tagsklist_padding = 2
theme.tagsklist_bar_gap = theme.modules_bar_gap

-----------------------
--    BAR SYSTRAY    --
-----------------------

theme.bg_systray            		= theme.modules_bg
theme.systray_border        		= theme.modules_border
theme.systray_rounded       		= theme.modules_rounded
theme.systray_icon_spacing  		= dpi(8)
theme.systray_padding_horizontal  	= 12
theme.systray_padding_vertical  	= 4
theme.systray_bar_gap 				= theme.modules_bar_gap

---------------------------
--     BAR LAYOUTBOX     --
---------------------------

theme.layoutbox_bar_gap 	= theme.modules_bar_gap

------------------
--     MENU     --
------------------

theme.menu_submenu_icon = theme_path.."submenu.png"
theme.menu_height       = dpi(38)
theme.menu_width        = dpi(200)
theme.menu_font         = theme.fontname .. 10
theme.menu_fg_normal    = theme.color01
theme.menu_bg_normal    = theme.color_darker_transparent
theme.menu_fg_focus     = theme.color_darker
theme.menu_bg_focus     = theme.color01
theme.menu_border_width = dpi(0)
theme.menu_border_color = theme.modules_border
theme.menu_shape    	= modules.rounded(4)
theme.menu_bar_gap 		= theme.modules_bar_gap

--------------------
--     PROMPT     --
--------------------

theme.prompt_fg = theme.color01
theme.prompt_bg = theme.color_dark

---------------------
--     HOTKEYS     --
---------------------

theme.hotkeys_fg            = theme.color01
theme.hotkeys_bg            = theme.color_black_transparent
theme.hotkeys_modifiers_fg  = theme.color02
theme.hotkeys_opacity       = 0.95
theme.hotkeys_border_width  = dpi(0)
theme.hotkeys_border_color  = theme.color01
theme.hotkeys_group_margin  = 80
theme.hotkeys_shape         = modules.rounded(theme.rounded_corners)

---------------------------
--     NOTIFICATIONS     --
---------------------------

-- Notifications
theme.notification_font         = theme.fontname .. 10
theme.notification_fg           = theme.color01
theme.notification_bg           = theme.color_black_transparent
theme.notification_opacity      = 1
theme.notification_margin       = 20
theme.notification_spacing      = 10
theme.notification_max_width    = 500
theme.notification_border_width = 1
theme.notification_border_color = theme.color_darker
theme.notification_shape        = modules.rounded(theme.rounded_corners)

-- Notify
theme.notify_font      			= theme.fontname
theme.notify_fg      			= theme.color01
theme.notify_bg      			= theme.color_black_transparent
theme.notify_icon_font      	= theme.notify_font .. 96
theme.notify_icon_fg      		= theme.notify_fg
theme.notify_icon_bg      		= theme.notify_bg
theme.notify_text_font    		= theme.notify_font .. 16
theme.notify_text_fg      		= theme.notify_fg
theme.notify_text_bg      		= theme.notify_bg
theme.notify_slider_fg 			= theme.notify_fg
theme.notify_slider_bg  		= theme.color_dark
theme.notify_slider_height    	= 4
theme.notify_slider_width    	= 170
theme.notify_slider_rounded    	= 20
theme.notify_shape        		= modules.rounded(theme.rounded_corners)

----------------------
--     TITLEBAR     --
----------------------

-- Titlebar
theme.titlebar_font         = theme.fontname .. 10
theme.titlebar_size         = dpi(32)
theme.titlebar_vmargin      = dpi(2)
theme.titlebar_hmargin      = dpi(4)
theme.titlebar_fg_focus     = theme.color01
theme.titlebar_bg_focus     = theme.bar_bg
theme.titlebar_fg_normal    = theme.color03
theme.titlebar_bg_normal    = theme.bar_bg
theme.titlebar_line_focus   = theme.titlebar_fg_focus
theme.titlebar_line_normal  = theme.titlebar_fg_normal

-- Close button
theme.titlebar_close_button_focus           = titlebar_path .. "close_focus.png"
theme.titlebar_close_button_focus_hover     = titlebar_path .. "close_focus_hover.png"
theme.titlebar_close_button_normal          = titlebar_path .. "close_normal.png"
theme.titlebar_close_button_normal_hover    = titlebar_path .. "close_normal_hover.png"

-- Minimize button
theme.titlebar_minimize_button_focus        = titlebar_path .. "minimize_focus.png"
theme.titlebar_minimize_button_focus_hover  = titlebar_path .. "minimize_focus_hover_empty.png"
theme.titlebar_minimize_button_normal       = titlebar_path .. "minimize_normal.png"
theme.titlebar_minimize_button_normal_hover = titlebar_path .. "minimize_normal_hover_empty.png"

-- Ontop button
theme.titlebar_ontop_button_focus_inactive          = titlebar_path .. "ontop_focus_inactive.png"
theme.titlebar_ontop_button_focus_inactive_hover    = titlebar_path .. "ontop_focus_inactive_hover.png"
theme.titlebar_ontop_button_focus_active            = titlebar_path .. "ontop_focus_active.png"
theme.titlebar_ontop_button_focus_active_hover      = titlebar_path .. "ontop_focus_active_hover.png"
theme.titlebar_ontop_button_normal_inactive         = titlebar_path .. "ontop_normal_inactive.png"
theme.titlebar_ontop_button_normal_inactive_hover   = titlebar_path .. "ontop_normal_inactive_hover.png"
theme.titlebar_ontop_button_normal_active           = titlebar_path .. "ontop_normal_active.png"
theme.titlebar_ontop_button_normal_active_hover     = titlebar_path .. "ontop_normal_active_hover.png"

-- Sticky button
theme.titlebar_sticky_button_normal_inactive    = titlebar_path .. "sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = titlebar_path .. "sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = titlebar_path .. "sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = titlebar_path .. "sticky_focus_active.png"

-- Floating button
theme.titlebar_floating_button_focus_active             = titlebar_path .. "floating_focus_active.png"
theme.titlebar_floating_button_focus_active_hover       = titlebar_path .. "floating_focus_active_hover.png"
theme.titlebar_floating_button_focus_inactive           = titlebar_path .. "floating_focus_inactive.png"
theme.titlebar_floating_button_focus_inactive_hover     = titlebar_path .. "floating_focus_inactive_hover.png"
theme.titlebar_floating_button_normal_active            = titlebar_path .. "floating_normal_active.png"
theme.titlebar_floating_button_normal_active_hover      = titlebar_path .. "floating_normal_active_hover.png"
theme.titlebar_floating_button_normal_inactive          = titlebar_path .. "floating_normal_inactive.png"
theme.titlebar_floating_button_normal_inactive_hover    = titlebar_path .. "floating_normal_inactive_hover.png"

-- Maximized button
theme.titlebar_maximized_button_normal_inactive     = titlebar_path .. "maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive      = titlebar_path .. "maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active       = titlebar_path .. "maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active        = titlebar_path .. "maximized_focus_active.png"

-- Layout Icons
theme.layout_fairh      = layouts_path .. "fairh.png"
theme.layout_fairv      = layouts_path .. "fairv.png"
theme.layout_floating   = layouts_path .. "floating.png"
theme.layout_magnifier  = layouts_path .. "magnifier.png"
theme.layout_max        = layouts_path .. "max.png"
theme.layout_fullscreen = layouts_path .. "fullscreen.png"
theme.layout_tilebottom = layouts_path .. "tilebottom.png"
theme.layout_tileleft   = layouts_path .. "tileleft.png"
theme.layout_tile       = layouts_path .. "tile.png"
theme.layout_tiletop    = layouts_path .. "tiletop.png"
theme.layout_spiral     = layouts_path .. "spiral.png"
theme.layout_dwindle    = layouts_path .. "dwindle.png"
theme.layout_cornernw   = layouts_path .. "cornernw.png"
theme.layout_cornerne   = layouts_path .. "cornerne.png"
theme.layout_cornersw   = layouts_path .. "cornersw.png"
theme.layout_cornerse   = layouts_path .. "cornerse.png"

-------------------
--     ICONS     --
-------------------

-- Awesome Icon
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.color01, theme.bar_bg
)

-- Icon theme
theme.icon_theme = nil

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return theme
