-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    "lukas-reineke/indent-blankline.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "nvim-lua/plenary.nvim",
    "lewis6991/gitsigns.nvim",
    "akinsho/nvim-bufferline.lua",
    "famiu/bufdelete.nvim",
    "nvim-lualine/lualine.nvim",
    "907th/vim-auto-save",
    "ryanoasis/vim-devicons",
    "sbdchd/neoformat",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-compe",
    "windwp/nvim-autopairs",
    "alvan/vim-closetag",
    "tweekmonster/startuptime.vim",
    "onsails/lspkind-nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-lua/popup.nvim",
    "karb94/neoscroll.nvim",
    {   
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ':TSUpdate'
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
        },
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- -- check if packer is installed (~/local/share/nvim/site/pack)
-- local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
-- local function source(file) vim.cmd("source $HOME/.config/nvim/vim/" .. file) end

-- -----------------
-- --     Vim     --
-- -----------------
-- source("simple-todo.vim")
-- source("SyntaxAttr.vim")

-- --------------------
-- --     Packer     --
-- --------------------
-- return require("packer").startup(
--     function()

--         -- Packer
--         use {"wbthomason/packer.nvim", opt = true}
--         -- Plugins
--         use "lukas-reineke/indent-blankline.nvim"
--         use "kyazdani42/nvim-web-devicons"
--         use "kyazdani42/nvim-tree.lua"
--         use "nvim-lua/plenary.nvim"
--         use "lewis6991/gitsigns.nvim"
--         use "akinsho/nvim-bufferline.lua"
--         use "famiu/bufdelete.nvim"
--         use "glepnir/galaxyline.nvim"
--         use "907th/vim-auto-save"
--         use "nvim-treesitter/nvim-treesitter"
--         use "nvim-treesitter/playground"
--         use "norcalli/nvim-colorizer.lua"
--         use "ryanoasis/vim-devicons"
--         use "sbdchd/neoformat"
--         use "neovim/nvim-lspconfig"
--         use "hrsh7th/nvim-compe"
--         use "windwp/nvim-autopairs"
--         use "alvan/vim-closetag"
--         use "tweekmonster/startuptime.vim"
--         use "onsails/lspkind-nvim"
--         use "nvim-telescope/telescope.nvim"
--         use "nvim-telescope/telescope-media-files.nvim"
--         use "nvim-lua/popup.nvim"
--         use "karb94/neoscroll.nvim"

--     end
-- )

