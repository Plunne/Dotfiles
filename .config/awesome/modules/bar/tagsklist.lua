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

local function filter_tag_with_tasklist(tag)

	return function(c)
		for _, i in ipairs(c:tags()) do	-- for each tag
			if i == tag then			-- if tag found
				return true				-- return true
			end
		end
		return false					-- otherwise return false
	end

end

--[[--------------------------------------------------------

GET TAG's TASKLIST

--]]--------------------------------------------------------

local function get_tag_tasklist(scr, tag)

	return awful.widget.tasklist({

		screen = scr,
		filter = filter_tag_with_tasklist(tag),
		buttons = require("keys.mouse").tasklist_mouse(),
		widget_template = {
			{
				-- apps icons
				{
					id = "clienticon",
					widget = awful.widget.clienticon
				},
                top 	= beautiful.tagsklist_icons_padding_vertical,
                bottom 	= beautiful.tagsklist_icons_padding_vertical,
                left  	= beautiful.tagsklist_icons_padding_horizontal,
                right 	= beautiful.tagsklist_icons_padding_horizontal,
                widget 	= wibox.container.margin,
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
	
	return modules.new(scr,
		beautiful.tagsklist_bar_gap,
		beautiful.tagsklist_bg,
		nil,
		beautiful.tagsklist_padding,
		beautiful.tagsklist_padding,
		beautiful.tagsklist_padding,
		beautiful.tagsklist_padding,
		beautiful.tagsklist_border,
		beautiful.tagsklist_border_size,
		beautiful.tagsklist_rounded,
		awful.widget.taglist
		{
			screen = scr,
			filter = awful.widget.taglist.filter.noempty,
			buttons = require("keys.mouse").taglist_mouse(),
			widget_template = {
				{
					{
						-- tag
						{
							{
								id = "text_role",
								widget = wibox.widget.textbox,
								align = "center"
							},
							left  	= beautiful.tagsklist_tag_margin, -- tag distance to left
							right 	= beautiful.tagsklist_tag_margin, -- tag distance too right
							top 	= 0,
							bottom 	= 0,
							widget = wibox.container.margin,
						},
						-- tasks
						{
							{
								id = "tasklist_placeholder",
								layout = wibox.layout.fixed.horizontal,
							},
							paddings      = {
								left   = beautiful.tagsklist_tasks_padding, -- tasks distance to tag (shall always be less than 0)
								right  = beautiful.tagsklist_tag_margin, -- tasks padding to right (shall always be equal to tag right margin)
								top    = 0,
								bottom = 0,
							},
							widget = wibox.container.border,
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
    	}
	)
end

--[[--------------------------------------------------------

EOF

--]]--------------------------------------------------------
