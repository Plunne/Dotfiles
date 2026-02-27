require "nvim-treesitter".setup {

    install_dir = vim.fn.stdpath('data') .. '/site',

    ensure_install = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "json",
        "lua",
        "python",
        "vim",
        "yaml"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

