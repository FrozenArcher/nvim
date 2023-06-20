-- plugins.tree-sitter: tree sitter plugin

return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
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

				-- required by lspsaga
				"markdown",
				"markdown_inline",
			},
			highlight = {
				enable = true,
			},
		})
	end,
}
