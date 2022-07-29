--[[

████████╗██╗  ██╗███████╗███╗   ███╗███████╗
╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
   ██║   ███████║█████╗  ██╔████╔██║█████╗  
   ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
   ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝

--]]

-- Import Modules

-- Import all modules requiered for theming.


local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local modules = require("lib.libmodules")

-- Paths

-- Theming paths.


local default_path = gfs.get_themes_dir()
local wall_path = os.getenv("HOME").."/.wallpapers/"
local theme_path = os.getenv("HOME").."/.config/awesome/themes/feather-dark/"
local layouts_path = theme_path .. "layouts/"
local titlebar_path = theme_path .."titlebar/"

-- Theme

-- Theme object instance.


local theme = {}

-- Wallpaper


theme.wallpaper = wall_path.."1196934.jpg"
--theme.wallpaper = wall_path.."rainbow-dash-my-little-pony-friendship-is-magic-cloudsdale-3940x2160-4558.png"

-- Fonts


theme.fontname          = "JetBrainsMono NerdFont " -- let the last space IMPORTANT!
theme.font              = theme.fontname .. 12

-- Config


theme.bar_size  = dpi(32)
theme.useless_gap   = dpi(4)
theme.border_width  = dpi(0)
theme.maximized_hide_border = true

-- Colors


theme.color01       = "#9783B1"
theme.color02       = "#6C5689"
theme.color03       = "#5E4A77"
theme.color_dark    = "#503F65"
theme.color_darker  = "#342942"
theme.color_black   = "#1E1826"
theme.color_light   = "#c4b8d3"
theme.color_urgent  = "#ff6c6b"
theme.color_gold    = "#da8548"
theme.color_cherry  = "#d70087"
theme.color_olive   = "#98be65"
theme.color_cyan    = "#7dcfff"
theme.color_dark_transparent    = theme.color_dark .. "e5"
theme.color_darker_transparent  = theme.color_darker .. "e5"
theme.color_black_transparent   = theme.color_black .. "e5"

-- Bar


theme.bg_bar    = theme.color_darker

-- Focus


theme.bg_focus      = theme.color01
theme.fg_focus      = theme.color_light
theme.bg_normal     = theme.color03
theme.fg_normal     = theme.color01
theme.bg_minimize   = theme.color_darker
theme.fg_minimize   = theme.color01
theme.bg_urgent     = theme.color_urgent
theme.fg_urgent     = theme.color_light

-- Modules


theme.modules_font      = theme.fontname .. 12
theme.bg_modules        = theme.color_darker
theme.bg_modules_icon   = theme.color02
theme.fg_modules_icon   = theme.color_darker
theme.bg_modules_text   = theme.color_darker
theme.fg_modules_text   = theme.color02
theme.border_modules    = theme.bg_modules_icon
theme.rounded_modules   = 4

-- Brightness


theme.brightness_icon_font          = theme.modules_font
theme.brightness_text_font          = theme.modules_font
theme.bg_modules_brightness         = theme.bg_modules_icon
theme.bg_modules_brightness_icon    = theme.bg_modules_icon
theme.fg_modules_brightness_icon    = theme.fg_modules_icon
theme.bg_modules_brightness_text    = theme.bg_modules_text
theme.fg_modules_brightness_text    = theme.color_gold

-- Clock


theme.clock_font            = theme.fontname .. 14
theme.fg_modules_clock      = theme.color01

-- Date


theme.date_icon = " "
theme.date_format = '%a %d %b'
theme.date_icon_font        = theme.modules_font
theme.date_text_font        = theme.modules_font
theme.bg_modules_date       = theme.bg_modules_icon
theme.bg_modules_date_icon  = theme.bg_modules_icon
theme.fg_modules_date_icon  = theme.fg_modules_icon
theme.bg_modules_date_text  = theme.bg_modules_text
theme.fg_modules_date_text  = theme.color_cherry

-- Datetime


theme.datetime_icon = " "
theme.datetime_format = '%a %d %b - %H:%M'
theme.datetime_icon_font        = theme.modules_font
theme.datetime_text_font        = theme.modules_font
theme.bg_modules_datetime       = theme.bg_modules_icon
theme.bg_modules_datetime_icon  = theme.bg_modules_icon
theme.fg_modules_datetime_icon  = theme.fg_modules_icon
theme.bg_modules_datetime_text  = theme.bg_modules_text
theme.fg_modules_datetime_text  = theme.color_cherry

-- Memory


theme.memory_icon = "﬙ "
theme.memory_icon_font          = theme.modules_font
theme.memory_text_font          = theme.modules_font
theme.bg_modules_memory         = theme.bg_modules_icon
theme.bg_modules_memory_icon    = theme.bg_modules_icon
theme.fg_modules_memory_icon    = theme.fg_modules_icon
theme.bg_modules_memory_text    = theme.bg_modules_text
theme.fg_modules_memory_text    = theme.color_cyan

-- Volume


theme.volume_icon_font          = theme.modules_font
theme.volume_text_font          = theme.modules_font
theme.bg_modules_volume         = theme.bg_modules_icon
theme.bg_modules_volume_icon    = theme.bg_modules_icon
theme.fg_modules_volume_icon    = theme.fg_modules_icon
theme.bg_modules_volume_text    = theme.bg_modules_text
theme.fg_modules_volume_text    = theme.color_olive

-- Taglist


theme.taglist_font          = theme.fontname .. 12
theme.taglist_bg            = theme.color02
theme.taglist_fg_focus      = theme.color01
theme.taglist_bg_focus      = theme.color_darker
theme.taglist_fg_occupied   = theme.color_darker
theme.taglist_bg_occupied   = theme.color02
theme.taglist_fg_urgent     = theme.color_darker
theme.taglist_bg_urgent     = theme.color02
theme.taglist_border        = theme.taglist_bg
theme.taglist_spacing       = dpi(1)
theme.taglist_shape         = modules.rounded(theme.rounded_modules)

-- Tasklist


theme.tasklist_font         = theme.fontname .. 10
theme.tasklist_bg           = theme.color01
theme.tasklist_fg_focus     = theme.color_darker
theme.tasklist_bg_focus     = theme.color01
theme.tasklist_fg_normal    = theme.color_darker
theme.tasklist_bg_normal    = theme.color02
theme.tasklist_fg_minimize  = theme.color02
theme.tasklist_bg_minimize  = theme.bg_bar
theme.tasklist_fg_urgent    = theme.color_light
theme.tasklist_bg_urgent    = theme.bg_modules
theme.tasklist_spacing      = dpi(6)
theme.tasklist_shape        = modules.rounded(theme.rounded_modules)
theme.tasklist_shape_border_width           = dpi(1)
theme.tasklist_shape_border_color           = theme.color02
theme.tasklist_shape_border_color_focus     = theme.color01
theme.tasklist_shape_border_color_minimized = theme.color03

-- Menu


theme.menu_submenu_icon = theme_path.."submenu.png"
theme.menu_height = dpi(32)
theme.menu_width  = dpi(200)
theme.menu_font = theme.fontname .. 10
theme.menu_fg_normal = theme.color01
theme.menu_bg_normal = theme.color_darker_transparent
theme.menu_fg_focus = theme.color_darker
theme.menu_bg_focus = theme.color01
theme.menu_border_width = dpi(0)
theme.menu_border_color = theme.color_dark

-- Systray


theme.bg_systray            = theme.bg_modules
theme.systray_border        = theme.border_modules
theme.systray_rounded       = theme.rounded_modules
theme.systray_icon_spacing  = dpi(8)

-- Notifications


theme.notification_font     = theme.fontname .. 10
theme.notification_fg       = theme.color01
theme.notification_bg       = theme.color_darker
theme.notification_opacity  = 1
theme.notification_margin   = 20
theme.notification_spacing  = 10
theme.notification_shape    = modules.rounded(8)
theme.notification_max_width = 500
theme.notification_border_width = 1
theme.notification_border_color = theme.color_darker

-- Notify


theme.notify_icon_font  = theme.fontname .. 96
theme.notify_text_font  = theme.fontname .. 16
theme.notify_bar_size       = 4
theme.notify_bar_rounded    = 20
theme.fg_notify_middle = theme.color01
theme.bg_notify_middle = theme.color_darker
theme.fg_notify_middle_bar = theme.color01
theme.bg_notify_middle_bar = theme.color_dark

-- Panel


theme.bg_panel = theme.color_black_transparent
theme.panel_x = 3840 - 656 - (theme.useless_gap * 2)
theme.panel_y = theme.bar_size + theme.useless_gap * 2
theme.panel_rounded = 8

-- Calendar


theme.panel_calendar_font           = theme.fontname .. 10
theme.panel_calendar_header_font    = theme.fontname .. 16
theme.panel_calendar_weekday_font   = theme.panel_calendar_font
theme.panel_calendar_normal_font    = theme.panel_calendar_font
theme.panel_calendar_focus_font     = theme.panel_calendar_font
theme.fg_panel_calendar_header      = theme.color_olive
theme.fg_panel_calendar_weekday     = theme.color_cherry
theme.fg_panel_calendar_week        = theme.color01
theme.fg_panel_calendar_weekend     = theme.color02
theme.fg_panel_calendar_focus       = theme.color_darker
theme.bg_panel_calendar_focus       = theme.color_olive

-- Clock


theme.panel_clock_font = theme.fontname .. 54
theme.panel_clock_hour_font   = theme.panel_clock_font
theme.panel_clock_sep_font    = theme.panel_clock_font
theme.panel_clock_min_font    = theme.panel_clock_font
theme.fg_panel_clock = theme.color01
theme.fg_panel_clock_hour   = theme.fg_panel_clock
theme.fg_panel_clock_sep    = theme.fg_panel_clock
theme.fg_panel_clock_min    = theme.fg_panel_clock

-- Powermenu


theme.panel_powermenu_font = theme.fontname .. 32
theme.panel_powermenu_logout_font   = theme.panel_powermenu_font
theme.panel_powermenu_restart_font  = theme.panel_powermenu_font
theme.panel_powermenu_poweroff_font = theme.panel_powermenu_font
theme.fg_panel_powermenu = theme.color01
theme.fg_panel_powermenu_logout   = theme.fg_panel_powermenu
theme.fg_panel_powermenu_restart  = theme.fg_panel_powermenu
theme.fg_panel_powermenu_poweroff = theme.color_cherry

-- Uptime


theme.panel_uptime_font = theme.fontname .. 10
theme.fg_panel_uptime   = theme.color02

-- Prompt


theme.prompt_fg     = theme.color01
theme.prompt_bg     = theme.color_dark

-- Hotkeys


theme.hotkeys_fg = theme.color01
theme.hotkeys_bg = theme.color_darker
theme.hotkeys_modifiers_fg = theme.color02
theme.hotkeys_opacity = 0.95
theme.hotkeys_border_width = dpi(0)
theme.hotkeys_border_color = theme.color01
theme.hotkeys_group_margin = 80
theme.hotkeys_shape = modules.rounded(8)

-- Titlebar


theme.titlebar_font         = theme.fontname .. 10
theme.titlebar_size         = dpi(32)
theme.titlebar_vmargin      = dpi(2)
theme.titlebar_hmargin      = dpi(4)
theme.titlebar_fg_focus     = theme.color01
theme.titlebar_bg_focus     = theme.bg_bar
theme.titlebar_fg_normal    = theme.color03
theme.titlebar_bg_normal    = theme.bg_bar
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

-- Awesome Icon


theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.color01, theme.color_dark
)

-- Icon theme


theme.icon_theme = nil

-- EOF (Theme)


return theme
