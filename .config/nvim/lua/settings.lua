local cmd = vim.cmd
local opt = vim.opt
local o = vim.o
local b = vim.bo
local g = vim.g
local w = vim.wo

---------------------
--     Settings    --
---------------------

local indent = 4

-- cmd
cmd("au BufNewFile,BufRead /*.rasi setf css")

o.showmode = false
o.wrap = false
w.relativenumber = true
o.background = "dark"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.syntax = "enable"
o.syntax = "on"
o.mouse = "a"
o.title = true
o.cursorline = true
o.termguicolors = true
w.number = true
o.numberwidth = 3
o.cmdheight = 1
o.history = 1000
w.signcolumn = "yes"
o.updatetime = 250            -- update interval for gitsigns 
o.clipboard = "unnamedplus"
-- scroll
o.scrolloff = 1
o.sidescrolloff = 10
-- split
o.splitright = true
o.splitbelow = true
-- search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
-- indent
b.autoindent = true
b.tabstop = indent
b.expandtab = false
b.shiftwidth = indent
o.shiftround = true
o.smarttab = true
-- g
g.mapleader = " "
g.auto_save = 0
g.one_nvim_transparent_bg = true
-- blankline
g.indentLine_enabled = 1
g.indent_blankline_char = "▎"
g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
