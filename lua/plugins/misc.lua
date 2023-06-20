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
			require("utils.keys").nmap("<leader>wx", "<cmd>TroubleToggle<cr>", "Open Trouble window")
		end,
	},
	{
		"TimUntersberger/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		config = function()
			require("utils.keys").nmap("<leader>wg", function()
				require("neogit").open()
			end, "Open neogit window")
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_date_format = "%r"
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		opts = {},
	},
}
