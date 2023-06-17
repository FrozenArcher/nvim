-- plugins.theme: colorscheme plugin
return {
	"rafamadriz/neon",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
}
