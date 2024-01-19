local awful = require("awful")
local beautiful = require("beautiful")
local modules = require("lib.libmodules")
local wibox = require("wibox")

--[[
   ___  ___   ___                            
  / _ )/ _ | / _ \                           
 / _  / __ |/ , _/                           
/____/_/_|_/_/|_|______ ____   ______________
/_  __/ _ |/ ___/ __/ //_/ /  /  _/ __/_  __/
 / / / __ / (_ /\ \/ ,< / /___/ /_\ \  / /   
/_/ /_/ |_\___/___/_/|_/____/___/___/ /_/    
                                             
--]]

--[[--------------------------------------------------------
        FILTER TAG w/ TASKLIST
--]]--------------------------------------------------------

local function filter_tag_with_tasklist(in_tag)

	return function(c)
		for _, i in ipairs(c:tags()) do	-- for each tag
			if i == in_tag then			-- if tag found
				return true				-- return true
			end
		end
		return false					-- otherwise return false
	end

end

--[[--------------------------------------------------------
        GET TAG's TASKLIST
--]]--------------------------------------------------------

local function get_tag_tasklist(in_scr, in_tag)

	return awful.widget.tasklist({

		screen = in_scr,
		filter = filter_tag_with_tasklist(in_tag),
		buttons = require("keys.mouse").tasklist_mouse(),
		widget_template = {
			{
				-- apps icons
				{
					id = "clienticon",
					widget = awful.widget.clienticon
				},
                top = 2,
                bottom = 2,
                left  = -6,
                right = 6,
                widget = wibox.container.margin,
			},
			layout = wibox.layout.stack,

			-- refresh client icon widget
			update_callback = function(self, c, _, _)
				self:get_children_by_id("clienticon")[1].client = c
			end
		}
	})

end

--[[--------------------------------------------------------
        TAGSKLIST
--]]--------------------------------------------------------

return function(scr)
	
	return modules.new(scr, 4, beautiful.taglist_bg, nil, 1, 1, 1, 1, beautiful.taglist_border, 1, beautiful.rounded_modules, awful.widget.taglist {

		screen = scr,
		filter = awful.widget.taglist.filter.noempty,
		buttons = require("keys.mouse").taglist_mouse(),
		widget_template = {
			{
				{
					-- tag
					{
						id = "text_role",
						widget = wibox.widget.textbox,
						align = "center"
					},
					-- tasklist
					{
						id = "tasklist_placeholder",
						layout = wibox.layout.fixed.horizontal,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				id = "background_role",
				widget = wibox.container.background
			},
			layout = wibox.layout.fixed.horizontal,

			create_callback = function(self, tag, index, _)
				self:get_children_by_id("tasklist_placeholder")[1]:add(get_tag_tasklist(scr, scr.tags[tag.index]))
			end
		}
    })

end