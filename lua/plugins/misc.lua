-- plugins.misc: misc plugins

return {
	{
		"kazhala/close-buffers.nvim",
		opts = {
			preserve_window_layout = { "this" },
			next_buffer_cmd = function(windows)
				require("bufferline").cycle(1)
				local bufnr = vim.api.nvim_get_current_buf()
				for _, window in ipairs(windows) do
					vim.api.nvim_win_set_buf(window, bufnr)
				end
			end,
		},
	},
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
	},
	{
		"TimUntersberger/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
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
