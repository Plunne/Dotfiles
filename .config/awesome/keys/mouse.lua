--[[--------------------------------------------------------
   __  _______  __  __________
  /  |/  / __ \/ / / / __/ __/
 / /|_/ / /_/ / /_/ /\ \/ _/  
/_/  /_/\____/\____/___/___/  

--]]--------------------------------------------------------

-- Import modules

-- Import all modules required for the Mouse configuration.


local awful = require("awful")
local panel = require("config.panel")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Import variables

-- Because I use some variables from my config.


require("vars")
require("lib.libkeys")
require("config.menu")

-- Hide popup

-- Function used to close popups everywhere outside of them.


local function hide_popup()
    mymainmenu:hide()
    panel.visible = false
end

-- Mouse

-- Mouse object instance.


local mouse = {}

-- General Mouse Bindings

-- Main mouse bindings function. This is where I set all my general mouse bindings.


function mouse.init() awful.mouse.append_global_mousebindings({

click(left_click, function() hide_popup() end),
click(right_click, function() mymainmenu:toggle() end)

})end

-- Client Buttons

-- Bindings used for clients interactions.


function mouse.clientbuttons()

    client.connect_signal("request::default_mousebindings", function()
        awful.mouse.append_client_mousebindings({
            
            click(left_click,               function() hide_popup() end),
            click(left_click,               function(c) c:activate { context = "mouse_click" } end),
            clickMod(super, left_click,     function(c) c:activate { context = "mouse_click", action = "mouse_move"  } end),
            clickMod(super, right_click,    function(c) c:activate { context = "mouse_click", action = "mouse_resize"} end)
        })
    end)

end

-- Taglist Buttons

-- Bindings used for taglist interactions.


function mouse.taglist_mouse() return {

    -- Hide popups
    click(left_click, function() hide_popup() end),
    
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

-- Tasklist Buttons

-- Bindings used for tasklist interactions.


function mouse.tasklist_mouse() return {

    -- Hide popups
    click(left_click, function() hide_popup() end),

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

-- Volume Buttons

-- Bindings used for volume controls.


local volume = require("keys.control.volume")

function mouse.volume_mouse() return {

    -- Toggle audio
    click(left_click,   function() volume.toggle() end),

    -- Up/Down audio
    click(scroll_up,    function() volume.up() end),
    click(scroll_down,  function() volume.down() end),

}end

-- Brightness Buttons

-- Bindings used for brightness controls.


local brightness = require("keys.control.brightness")

function mouse.light_mouse() return {

    -- Up/Down light
    click(scroll_up,    function() brightness.up() end),
    click(scroll_down,  function() brightness.down() end)

}end

-- EOF (End of Keyboard)


return mouse
