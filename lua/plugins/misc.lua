-- plugins.misc: misc plugins

return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            enable_check_bracket_line = false,
        },
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {},
    },
    {
        "luukvbaal/statuscol.nvim",
        opts = {},
    },
    {
        "ecthelionvi/NeoColumn.nvim",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            require("utils.keys").nmap("<leader>xx", "<cmd>TroubleToggle<cr>")
        end
    },
    {
        'TimUntersberger/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {},
        config = function()
            require("utils.keys").nmap("<leader>G", function()
                require("neogit").open()
            end)
        end
    },
}
