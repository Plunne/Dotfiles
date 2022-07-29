-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local function source(file) vim.cmd("source $HOME/.config/nvim/vim/" .. file) end

-----------------
--     Vim     --
-----------------
source("simple-todo.vim")
source("SyntaxAttr.vim")

--------------------
--     Packer     --
--------------------
return require("packer").startup(
    function()

        -- Packer
        use {"wbthomason/packer.nvim", opt = true}
        -- Plugins
        use "lukas-reineke/indent-blankline.nvim"
        use "kyazdani42/nvim-web-devicons"
        use "kyazdani42/nvim-tree.lua"
        use "nvim-lua/plenary.nvim"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "famiu/bufdelete.nvim"
        use "glepnir/galaxyline.nvim"
        use "907th/vim-auto-save"
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/playground"
        use "norcalli/nvim-colorizer.lua"
        use "ryanoasis/vim-devicons"
        use "sbdchd/neoformat"
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use "tweekmonster/startuptime.vim"
        use "onsails/lspkind-nvim"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"
        use "karb94/neoscroll.nvim"

    end
)

