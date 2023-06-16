require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "cpp",
        "c_sharp",
        "cmake",
        "ini",
        "jsonc",
        "python",
        "rust",
        "go",
        "lua",
        "vim",
    },
    highlight = {
        enable = true,
    },
})
