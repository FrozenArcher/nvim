-- plugins.which-key: key binding manager
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.register({
			["<leader>"] = {
				l = {
					name = "LSP Actions",
					r = "Rename",
				},
				d = {
					name = "Show diagnostics",
				},
				w = {
					name = "Open UI Window",
				},
				f = {
					name = "Telescope find",
				},
				c = {
					name = "Close...",
				},
				s = {
					name = "Spectre search",
				},
			},
			["f"] = {
				name = "Hop actions",
			},
		})
	end,
}
