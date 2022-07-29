local cmd = vim.cmd
local g = vim.g

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

---------------------
--     Settings    --
---------------------

-- cmd
cmd("set noshowmode")
cmd("set nowrap")
cmd("au BufNewFile,BufRead /*.rasi setf css")
-- opt
opt("o", "background", "dark")
opt("o", "encoding", "utf-8")
opt("o", "fileencoding", "utf-8")
opt("o", "syntax", "enable")
opt("o", "syntax", "on")
opt("o", "mouse", "a")
opt("o", "title", true)
opt("o", "cursorline", true)
opt("o", "termguicolors", true)
opt("w", "number", true)
opt("o", "numberwidth", 3)
opt("o", "cmdheight", 1)
opt("o", "history", 1000)
opt("w", "signcolumn", "yes")
opt("o", "updatetime", 250)             -- update interval for gitsigns 
opt("o", "clipboard", "unnamedplus")
-- scroll
opt("o", "scrolloff", 1)
opt("o", "sidescrolloff", 10)
-- split
opt("o", "splitright", true)
opt("o", "splitbelow", true)
-- search
opt("o", "hlsearch", true)
opt("o", "incsearch", true)
opt("o", "ignorecase", true)
opt("o", "smartcase", true)
-- indent
opt("b", "autoindent", true)
opt("b", "tabstop", 4)
opt("b", "expandtab", false)
opt("b", "shiftwidth", 4)
opt("o", "shiftround", true)
opt("o", "smarttab", true)
-- g
g.mapleader = " "
g.auto_save = 0
g.one_nvim_transparent_bg = true

-- blankline
local indent = 4
g.indentLine_enabled = 1
g.indent_blankline_char = "▎"
g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
