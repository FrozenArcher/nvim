-- plugins.lua: manage plugins

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugin list
require("lazy").setup({
    -- Color scheme
    {
        "rafamadriz/neon",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.g.neon_style = "dark"
            vim.g.neon_italic_comment = true
            vim.g.neon_italic_keyword = true
            vim.g.neon_italic_function = true
            vim.g.neon_italic_boolean = true
            vim.g.neon_italic_variable = true
            vim.g.neon_bold = true
            vim.cmd([[colorscheme neon]])
        end,
    },

    -- LSP
    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "dcampos/cmp-snippy",
            "dcampos/nvim-snippy",
            "petertriho/cmp-git",
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- "j-hui/fidget.nvim",
            -- "folke/neodev.nvim",
            -- "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
        },
    },

    -- Ui
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        lazy = false;
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },


    -- Utils
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
})

-- Start plugins
require("plug-config")
