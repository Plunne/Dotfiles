vim.o.termguicolors = true

local color00 = "#9783b1"
local color01 = "#503f65"
local color02 = "#342942"
local transparent = "#00000000"

require "bufferline".setup {

    options = {
        
        -- Numbers
        --numbers = function(opts) return string.format('%s', opts.id) end,
        
        -- Tabs
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        
        -- Style
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        offsets = {{filetype = "NvimTree", text = "", text_align = "left"}},
        separator_style = "thin"
    },

    highlights = {

        -- Background
        background = { guifg = color01, guibg = transparent },

        -- Buffers
        buffer_selected = { guifg = color00, guibg = transparent, gui = "bold" },
        buffer_visible = { guifg = color00, guibg = transparent },

        -- Close buttons
        close_button = { guifg = color01, guibg = transparent },
        close_button_visible = { guifg = color00, guibg = transparent },
        close_button_selected = { guifg = color00, guibg = transparent },
        
        -- Fill
        fill = { guifg = transparent, guibg = transparent },
        
        -- Indicator
        indicator_selected = { guifg = color00, guibg = transparent },

        -- Modified
        modified = { guifg = color01, guibg = transparent },
        modified_visible = { guifg = color00, guibg = transparent },
        modified_selected = { guifg = color00, guibg = transparent },

        -- Separators
        separator = { guifg = color01, guibg = transparent },
        separator_visible = { guifg = color00, guibg = transparent },
        separator_selected = { guifg = color01, guibg = transparent },
        
        -- Tabs
        tab = { guifg = color01, guibg = transparent },
        tab_selected = { guifg = color00, guibg = transparent },
        tab_close = { guifg = color00, guibg = transparent } 
    }
}

local opt = {silent = true}

vim.g.mapleader = " "

--command that adds new buffer and moves to it
vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
vim.api.nvim_set_keymap("n","<S-b>",":New ", opt)

-- tabnew and tabprev
vim.api.nvim_set_keymap("n", "<Tab>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<S-Tab>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
