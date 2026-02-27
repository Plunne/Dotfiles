--[[------------------------------------
--     LUALINE
--]]------------------------------------

------------
-- Colors --
------------

local colors = {
	-- Main
    main = "#9783b1",
	-- Background
    bg 			= "NONE",
    bg_alt 		= "#342942",
    bg_black 	= "#251d2f",
	-- Foreground
    fg 			= "#9783b1",
    commented 	= "#503f65",
	-- Primary
    green 	= "#008700",
    olive 	= "#98be65",
    orange 	= "#da8548",
    yellow 	= "#d7af5f",
    gold 	= "#af875f",
    blue 	= "#51afef",
    marine 	= "#2257a0",
    ocean 	= "#5699af",
    teal 	= "#1abc9c",
    cyan 	= "#7dcfff",
    red 	= "#ff6c6b",
    wine 	= "#af0000",
    cherry 	= "#d70087",
    white 	= "#abb2bf",
    black 	= "#000000",
}

local git_colors = {
    branch 		= colors.olive,
    added 		= colors.green,
    modified 	= colors.blue,
    removed 	= colors.wine
}
--------------
-- Vim Mode --
--------------
local mode_map = {
    n = {"  NORMAL ",  	colors.main, 	colors.bg_alt },
    c = {"   ", 			colors.bg_alt, 	colors.white },
    i = {"  INSERT ",  	colors.cyan, 	colors.bg_alt },
    R = {"  REPLACE ", 	colors.gold, 	colors.bg_alt },
    v = {"  VISUAL ",  	colors.olive, 	colors.bg_alt },
    V = {"  VISUAL ",  	colors.olive, 	colors.bg_alt },
    [""] = {"  VISUAL ", colors.olive, 	colors.bg_alt } 
}

local mode_label_idx = 1
local mode_bg_idx = 2
local mode_fg_idx = 3

local function mode_label() return mode_map[vim.fn.mode()][mode_label_idx] or 'N/A' end

---------
-- Git --
---------

local function git_branch()

	local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

	if branch_name ~= "" then
		return "󰊢 " .. branch_name
	else
		return ""
	end
end

------------
-- Themes --
------------

local feather_dark = {

    normal = {
        a = { fg = mode_map["n"][mode_fg_idx], 	bg = mode_map["n"][mode_bg_idx], 	gui="bold" },
        b = { fg = colors.fg, 	            	bg = colors.bg_alt },
        c = { fg = git_colors.branch,    		bg = colors.bg },
        x = { fg = colors.fg, 	            	bg = colors.bg },
        y = { fg = colors.fg, 	            	bg = colors.bg },
        z = { fg = mode_map["n"][mode_fg_idx], 	bg = mode_map["n"][mode_bg_idx], 	gui="bold" },
    },

    insert  = { a = { fg = mode_map["i"][mode_fg_idx], 	bg = mode_map["i"][mode_bg_idx], 	gui="bold"}},
    visual  = { a = { fg = mode_map["v"][mode_fg_idx], 	bg = mode_map["v"][mode_bg_idx], 	gui="bold"}},
    replace = { a = { fg = mode_map["R"][mode_fg_idx], 	bg = mode_map["R"][mode_bg_idx], 	gui="bold"}},
    command = { a = { fg = mode_map["c"][mode_fg_idx], 	bg = mode_map["c"][mode_bg_idx], 	gui="bold"}},
    
    inactive = {
        a = { fg = colors.bg_black, 	bg = colors.bg, 	gui="bold" },
        b = { fg = colors.commented, 	bg = colors.bg_black },
        c = { fg = colors.commented, 	bg = colors.bg },
        x = { fg = colors.commented, 	bg = colors.bg },
        y = { fg = colors.commented, 	bg = colors.bg },
        z = { fg = colors.commented, 	bg = colors.bg_black, 	gui="bold" },
    },
}

-----------
-- Setup --
-----------

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = feather_dark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },

  -- Active Sections --

  sections = {
	
	-- Active Left Side --
	
	-- ALModule Vim Mode
    lualine_a = {
		{
            mode_label,
            separator  	= { left = "", right="" },
            padding  	= { left = 0,  	right = 0 },
        }
	},
	-- ALModule File
    lualine_b = {
		{	
			'filetype',
			icon_only 	= true,
            padding 	= { left = 1, right = 0 },
		},
		{
			'filename',
        	separator  	= { left = "", 	right="" },
            padding 	= { left = 1, 	right = 1 },
            file_status = true, 	-- Displays file status (readonly status, modified status)
            path = 3,               -- 0: Just the filename
                                    -- 1: Relative path
                                    -- 2: Absolute path
                                    -- 3: Absolute path, with tilde as the home directory
                                    -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                    -- for other components. (terrible name, any suggestions?)
                                    -- It can also be a function that returns
                                    -- the value of `shorting_target` dynamically.
            symbols = {
                modified = "󰀝",     -- Text to show when the file is modified.
                readonly = "",     -- Text to show when the file is non-modifiable or readonly.
                unnamed = " ",     -- Text to show for unnamed buffers.
            }
		}
	},
	-- ALModule Git
    lualine_c = {
		{
			git_branch,
			padding  	= { left = 1,  	right = 0 }
		},
		{
			'diff',
			colored = true, -- Displays a colored diff status if set to true
			diff_color = {
				-- Same color values as the general color option can be used here.
				added    = { fg = git_colors.added },    -- Changes the diff's added color
				modified = { fg = git_colors.modified }, -- Changes the diff's modified color
				removed  = { fg = git_colors.removed }, 	-- Changes the diff's removed color you
			},
			symbols = {added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
		}
	},

	-- Active Right Side --
	
	-- ARModule Diag
    lualine_x = {
        {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.yellow },
                info = { fg = colors.blue },
            }
        },
    },
	-- ARModule Format
    lualine_y = {
		{
			'fileformat',
			padding  	= { left = 1,  	right = 0 }
		},
		{
			'encoding',
			padding  	= { left = 1,  	right = 1 }
		},
	},
	-- ARModule Pos
    lualine_z = {
		{
			function() return "" end,
			separator  	= { left = "", right="" },
			padding  	= { left = 1,  	right = 0 }

		},
		{
			'location',
			padding  	= { left = 1,  	right = 1 }
		},
		{
			function() return " " end,
			padding  	= { left = 0,  	right = 0 }
		},
		{
			'progress',
			separator  	= { left = "", right="" },
			padding  	= { left = 1,  	right = 1 }
		}
	}
  },

  -- Inactive Sections --

  inactive_sections = {

	-- Inactive Left Side --
	
	-- ILModule Delimiter
    lualine_a = {
		{
			function() return "" end,
			padding  	= { left = 0,  	right = 0 }
		}
	},
	-- ILModule File
    lualine_b = {
		{	
			'filetype',
			icon_only 	= true,
            padding 	= { left = 1, right = 0 },
		},
		{
			'filename',
        	separator  	= { left = "", 	right="" },
            padding 	= { left = 1, 	right = 1 },
            file_status = true, 	-- Displays file status (readonly status, modified status)
            path = 3,               -- 0: Just the filename
                                    -- 1: Relative path
                                    -- 2: Absolute path
                                    -- 3: Absolute path, with tilde as the home directory
                                    -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                    -- for other components. (terrible name, any suggestions?)
                                    -- It can also be a function that returns
                                    -- the value of `shorting_target` dynamically.
            symbols = {
                modified = "󰀝",     -- Text to show when the file is modified.
                readonly = "",     -- Text to show when the file is non-modifiable or readonly.
                unnamed = " ",     -- Text to show for unnamed buffers.
            }
		}
	},
	-- ILModule Git
    lualine_c = {
		{
			git_branch,
			padding  	= { left = 1,  	right = 1 }
		},
		{
			'diff',
			colored = true, -- Displays a colored diff status if set to true
			diff_color = {
				-- Same color values as the general color option can be used here.
				added    = { fg = git_colors.added },    -- Changes the diff's added color
				modified = { fg = git_colors.modified }, -- Changes the diff's modified color
				removed  = { fg = git_colors.removed }, 	-- Changes the diff's removed color you
			},
			symbols = {added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
		}
	},

	-- Inactive Right Side --
	
	-- ILModule Empty
    lualine_x = {},
	-- ILModule Format
    lualine_y = {
		{
			'fileformat',
			padding  	= { left = 1,  	right = 0 }
		},
		{
			'encoding',
			padding  	= { left = 1,  	right = 1 }
		},
	},
	-- ILModule Pos
    lualine_z = {
		{
			function() return "" end,
			separator  	= { left = "", right="" },
			padding  	= { left = 1,  	right = 0 }

		},
		{
			'location',
			padding  	= { left = 1,  	right = 1 }
		},
		{
			function() return " " end,
			padding  	= { left = 0,  	right = 0 }
		},
		{
			'progress',
			separator  	= { left = "", right="" },
			padding  	= { left = 1,  	right = 1 }
		},
	}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
