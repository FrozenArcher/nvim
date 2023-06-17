-- plugins.misc: misc plugins

return {
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			require("statuscol").setup()
		end,
	},
	{
		"ecthelionvi/NeoColumn.nvim",
		config = function()
			require("NeoColumn").setup()
		end,
	},
	{
		-- attach to lsp server
		-- start in lsp.lua
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
}
