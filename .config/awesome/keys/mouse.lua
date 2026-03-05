--[[ mouse.lua
   __  _______  __  __________
  /  |/  / __ \/ / / / __/ __/
 / /|_/ / /_/ / /_/ /\ \/ _/  
/_/  /_/\____/\____/___/___/  

--]]-- by Lena SAVY-LARIGALDIE aka Plunne

--[[--------------------------------------------------------

IMPORT MODULES

Import all modules required for the Mouse configuration.

--]]--------------------------------------------------------

local awful = require("awful")
local panel = require("custom.panel")
local calentime = require("custom.calentime")
local hotkeys_popup = require("awful.hotkeys_popup")

--[[--------------------------------------------------------

IMPORT VARIABLES

Because I use some variables from my config.

--]]--------------------------------------------------------

require("vars")
require("lib.libkeys")
require("custom.menu")

--[[--------------------------------------------------------

HIDE POPUP

Function used to close popups everywhere outside of them.

--]]--------------------------------------------------------


local function hide_popups(hide_except)

	local popups_to_hide = {

		menu 		= function() mymainmenu:hide() end,
		panel 		= function() panel.visible = false end,
		calentime 	= function() calentime.visible = false end,
	}

	for pop, hide in pairs(popups_to_hide) do
		if pop ~= hide_except then
			hide()
		end
	end

end

--[[--------------------------------------------------------

MOUSE

Mouse object instance.

--]]--------------------------------------------------------

local mouse = {}

--[[--------------------------------------------------------

GENERAL MOUSE BINDINGS

Main mouse bindings function. This is where I set all my general mouse bindings.

--]]--------------------------------------------------------

mouse.init = function() awful.mouse.append_global_mousebindings({

    click(left_click, function() hide_popups() end),
    click(right_click, function() mymainmenu:toggle() end)

})end

--[[--------------------------------------------------------

CLIENT BUTTONS

Bindings used for clients interactions.

--]]--------------------------------------------------------

mouse.clientbuttons = function()

    client.connect_signal("request::default_mousebindings", function()
        awful.mouse.append_client_mousebindings({
            
            click(left_click,               function() hide_popups() end),
            click(left_click,               function(c) c:activate { context = "mouse_click" } end),
            clickMod(super, left_click,     function(c) c:activate { context = "mouse_click", action = "mouse_move"  } end),
            clickMod(super, right_click,    function(c) c:activate { context = "mouse_click", action = "mouse_resize"} end)
        })
    end)

end

--[[--------------------------------------------------------

BAR BUTTONS

Bindings used for the bar.

--]]--------------------------------------------------------

mouse.bar_mouse = function() return {

    click(left_click, function() hide_popups() end)

}end

--[[--------------------------------------------------------

TAGLIST BUTTONS

Bindings used for taglist interactions.

--]]--------------------------------------------------------

mouse.taglist_mouse = function() return {

    -- Hide popups
    click(left_click, function() hide_popups() end),
    
    -- Switch/Toggle desktop
    click(left_click,   function(t) t:view_only() end),	
    click(right_click,  awful.tag.viewtoggle),

    -- Next/Previous desktop
    click(scroll_up,    function(t) awful.tag.viewnext(t.screen) end),
    click(scroll_down,  function(t) awful.tag.viewprev(t.screen) end),

    -- Move the active window to the desktop
    clickMod(super, left_click, 
        function(t)			        
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),

    -- Clone the active window to the desktop
    clickMod(super, right_click, 
        function(t)			    
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    )

}end

--[[--------------------------------------------------------

TASKLIST BUTTONS

Bindings used for tasklist interactions.

--]]--------------------------------------------------------

mouse.tasklist_mouse = function() return {

    -- Hide popups
    click(left_click, function() hide_popups() end),

    -- Toggle window
    click(left_click,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal("request::activate", "tasklist", {raise = true} )
            end
        end
    ),

    -- Tasklist menu
    click(right_click, function () awful.menu.client_list( { theme = { width = 250 } } ) end),

    -- Next/Previous window
    click(scroll_up,    function () awful.client.focus.byidx( 1) end),
    click(scroll_down,  function () awful.client.focus.byidx(-1) end)

}end

--[[--------------------------------------------------------

VOLUME BUTTONS

Bindings used for volume controls.

--]]--------------------------------------------------------

local volume = require("keys.control.volume")

mouse.volume_mouse = function() return {

    -- Toggle audio
    click(left_click,   function() volume.toggle() end),

    -- Up/Down audio
    click(scroll_up,    function() volume.up() end),
    click(scroll_down,  function() volume.down() end),

}end

--[[--------------------------------------------------------

BRIGHTNESS BUTTONS

Bindings used for brightness controls.

--]]--------------------------------------------------------

local brightness = require("keys.control.brightness")

mouse.light_mouse = function() return {

    -- Up/Down light
    click(scroll_up,    function() brightness.up() end),
    click(scroll_down,  function() brightness.down() end)

}end

--[[--------------------------------------------------------

MENU BUTTONS

Bindings used for the mainmenu.

--]]--------------------------------------------------------

mouse.menu_mouse = function() return {

    click(left_click, function()
		hide_popups("menu")
		mymainmenu:toggle()
	end)

}end

--[[--------------------------------------------------------

PANEL BUTTONS

Bindings used for the panel.

--]]--------------------------------------------------------

mouse.panel_mouse = function() return {

    click(left_click, function() 
		hide_popups("panel")
		panel.visible = not panel.visible
	end)

}end

--[[--------------------------------------------------------

CALENTIME BUTTONS

Bindings used for calentime.

--]]--------------------------------------------------------

mouse.calentime_mouse = function() return {

    click(left_click, function() 
		hide_popups("calentime")
		calentime.visible = not calentime.visible
	end)

}end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return mouse
