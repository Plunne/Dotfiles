local color00 = "#9783b1"
local color01 = "#503f65"
local color02 = "#342942"

require("bufferline").setup {

    options = {
        
        -- Tabs
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        
        -- Style
		themable = true,
        indicator_icon = " ",
		show_tab_indicators = false,
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 24,
        max_prefix_length = 4,
        tab_size = 24,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        offsets = {{ filetype = "NvimTree", highlight = "Directory", separator = true, text_align = "left" }},
        separator_style = { '|', '|' }
    },

    highlights = {

        -- Background
        background = { fg = color01, bg = nil },

        -- Buffers
        buffer_selected = { fg = color00, bg = nil, bold = true, italic = false },
        buffer_visible = { fg = color00, bg = nil },

        -- Close buttons
        close_button = { fg = color01, bg = nil },
        close_button_visible = { fg = color00, bg = nil },
        close_button_selected = { fg = color00, bg = nil },
        
        -- Fill
        fill = { fg = nil, bg = nil },
        
        -- Indicator
        indicator_selected = { fg = color00, bg = nil },

        -- Modified
        modified = { fg = color01, bg = nil },
        modified_visible = { fg = color00, bg = nil },
        modified_selected = { fg = color00, bg = nil },

        -- Separators
        separator = { fg = color01, bg = nil },
        separator_visible = { fg = color00, bg = nil },
        separator_selected = { fg = color01, bg = nil },
        
        -- Tab Separators
        tab_separator = { fg = color01, bg = nil },
        tab_separator_selected = { fg = color01, bg = nil },

        -- Offset Separator
		offset_separator = { fg = color01, bg = nil },
        
		-- Tabs
        tab = { fg = color01, bg = nil },
        tab_selected = { fg = color00, bg = nil },
        tab_close = { fg = color00, bg = nil } 
    };
}

local opt = {silent = true}

vim.g.mapleader = " "

--command that adds new buffer and moves to it
vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
vim.api.nvim_set_keymap("n","<S-b>",":New ", opt)

-- tabnew and tabprev
vim.api.nvim_set_keymap("n", "<Tab>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<S-Tab>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
