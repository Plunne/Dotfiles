--[[ keyboard.lua
   __ ________  _____  ____  ___   ___  ___ 
  / //_/ __/\ \/ / _ )/ __ \/ _ | / _ \/ _ \
 / ,< / _/   \  / _  / /_/ / __ |/ , _/ // /
/_/|_/___/   /_/____/\____/_/ |_/_/|_/____/ 

--]]-- by Lena SAVY-LARIGALDIE aka Plunne

--[[--------------------------------------------------------

IMPORT MODULES

Import all modules required for the Keyboard configuration.

--]]--------------------------------------------------------

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local brightness = require("keys.control.brightness")
local player = require("keys.control.player")
local volume = require("keys.control.volume")

--[[--------------------------------------------------------

IMPORT VARIABLES

Because I use some variables from my config.

--]]--------------------------------------------------------

require("vars")
require("lib.libkeys")
require("custom.menu")

--[[--------------------------------------------------------

KEYBOARD

Keyboard object instance.

--]]--------------------------------------------------------

local keyboard = {}

--[[--------------------------------------------------------

GENERAL KEYBINDINGS

Main keybindings function. This is where I set all my general keybindings.

--]]--------------------------------------------------------

keyboard.init = function() awful.keyboard.append_global_keybindings({

------------------
--     Apps     --
------------------
bindApp(super,          enter,  "Terminal",                     terminal),
bindApp(super,          "b",    "Browser",                      browser),
bindApp(super,          "c",    "Calulator",                    calc),
bindApp(super,          "e",    "Editor",                       editor),
bindApp(super,          "p",    "File Manager",                 filemanager),
bindApp(alt,            space,  "Launcher",                     rofi_launcher),
bindApp({},             print,  "Screenshot (Screen)",          screenshot),
bindApp(super_shift,    print,  "Screenshot (Screen + Delay)",  screenshot_delay),
bindApp(super,          print,  "Screenshot (Region)",          screenshot_region),
bindApp(super_ctrl,     print,  "Screenshot (Region + Delay)",  screenshot_region_delay),

---------------------
--     Awesome     --
---------------------
bind(super,         "h",    "Awesome", "Help",              hotkeys_popup.show_help),
bind(super,         "m",    "Awesome", "Menu",              function() mymainmenu:show() end),
bind(super_shift,   "r",    "Awesome", "Reload Awesome",    awesome.restart),
bind(super_shift,   "q",    "Awesome", "Quit Awesome",      awesome.quit),

----------------------
--     Controls     --
----------------------

-- Brightness
bindCtl("XF86MonBrightnessUp",     "Brightness Up",     function() brightness.up() end),
bindCtl("XF86MonBrightnessUp",     "Brightness Down",   function() brightness.down() end),
-- Volume
bindCtl("XF86AudioRaiseVolume",    "Volume Up",         function() volume.up() end),
bindCtl("XF86AudioLowerVolume",    "Volume Down",       function() volume.down() end),
bindCtl("XF86AudioMute",           "Volume Toggle",     function() volume.toggle() end),
-- Player
bindCtl("XF86AudioPlay",           "Play",              function() player.play_pause() end),
bindCtl("XF86AudioPause",          "Pause",             function() player.play_pause() end),
bindCtl("XF86AudioNext",           "Next",              function() player.next() end),
bindCtl("XF86AudioPrev",           "Previous",          function() player.prev() end),

--------------------
--     Screen     --
--------------------

bind(super_ctrl,    "j", "Screen", "Focus previous screen",    function() awful.screen.focus_relative(-1) end),
bind(super_ctrl,    "k", "Screen", "Focus next screen",        function() awful.screen.focus_relative( 1) end),

--------------------
--     Layout     --
--------------------

-- Next layout
bind(super,         tab,    "Layout", "Next layout",                function() awful.layout.inc( 1) end),
-- Master width factor
bind(super_ctrl,    left,   "Layout", "Master width factor -",      function() awful.tag.incmwfact(-0.05) end),
bind(super_ctrl,    right,  "Layout", "Master width factor +",      function() awful.tag.incmwfact( 0.05) end),
-- Master client number
bind(super_ctrl,    down,   "Layout", "Master clients number -",    function() awful.tag.incnmaster(-1, nil, true) end),
bind(super_ctrl,    up,     "Layout", "Master clients number +",    function() awful.tag.incnmaster( 1, nil, true) end),

--------------------
--     Client     --
--------------------

-- Focus
bind(super,         "u",    "Client Focus", "Focus urgent",         awful.client.urgent.jumpto ),
bind(super,         "j",    "Client Focus", "Focus previous",       function() awful.client.focus.byidx(-1) end),
bind(super,         "k",    "Client Focus", "Focus next",           function() awful.client.focus.byidx( 1) end),
bind(super,         left,   "Client Focus", "Focus left",           function() awful.client.focus.global_bydirection("left") end),
bind(super,         right,  "Client Focus", "Focus right",          function() awful.client.focus.global_bydirection("right") end),
bind(super,         up,     "Client Focus", "Focus top",            function() awful.client.focus.global_bydirection("up") end),
bind(super,         down,   "Client Focus", "Focus bottom",         function() awful.client.focus.global_bydirection("down") end),
-- Move
bind(super_shift,   "j",    "Client Move", "Move with previous",    function() awful.client.swap.byidx(-1) end ),
bind(super_shift,   "k",    "Client Move", "Move with next",        function() awful.client.swap.byidx( 1) end ),
bind(super_shift,   left,   "Client Move", "Move with left",        function() awful.client.swap.global_bydirection("left") end),
bind(super_shift,   right,  "Client Move", "Move with right",       function() awful.client.swap.global_bydirection("right") end),
bind(super_shift,   up,     "Client Move", "Move with top",         function() awful.client.swap.global_bydirection("up") end),
bind(super_shift,   down,   "Client Move", "Move with bottom",      function() awful.client.swap.global_bydirection("down") end),

----------------------
--     Desktops     --
----------------------

-- Go to tag
bindNum(super, "Tag", "Tag", 
    function(index)
        local tag = root.tags()[index]
        if tag then
            tag:view_only()
        end
    end
),

-- Toogle tag
bindNum(super_ctrl, "Tag", "Toggle",
    function(index)
        local tag = root.tags()[index]
        if tag then
            awful.tag.viewtoggle(tag)
        end
    end
),

-- Move to
bindNum(super_shift, "Tag", "Move client to",
    function(index)
        if client.focus then
            local tag = root.tags()[index]
            if tag then
                client.focus:move_to_tag(tag)
            end
        end
    end
),

-- Toggle to
bindNum(super_alt, "Tag", "Toggle client on",
    function(index)
        if client.focus then
            local tag = root.tags()[index]
            if tag then
                client.focus:toggle_tag(tag)
            end
        end
    end
),

})end

--[[--------------------------------------------------------

CLIENT KEYS

Bindings used for clients interactions.

--]]--------------------------------------------------------

keyboard.clientkeys = function()
    
    client.connect_signal("request::default_keybindings", function()
        awful.keyboard.append_client_keybindings({

            -- Client Close
            bind(super, "F4",   "Client", "Close window",       function(c) c:kill() end),
            bind(super, "o",    "Client", "Move to screen",     function(c) c:move_to_screen() end),
            bind(super, "F11",  "Client", "Fullscreen window",  function(c) c.fullscreen = not c.fullscreen c:raise() end),
            bind(super, "f",    "Client", "Floating window",    function(c) c.floating = not c.floating c:raise() end),

        })
    end)

end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------

return keyboard