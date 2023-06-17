-- plugins.lualine: status line
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
		},
		config = function()
			local navic_location = function()
				return require("nvim-navic").get_location()
			end
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "onedark",
					component_separators = "|",
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					-- lualine_a = { "mode" },
					--lualine_b = { "branch", "diff", "diagnostics" },
					--lualine_c = { "filename" },
					--lualine_x = { "encoding", "fileformat", "filetype" },
					--lualine_y = { "progress" },
					--lualine_z = { "location" },
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "filename", "branch", "diff" },
					lualine_c = { navic_location },
					lualine_x = { "diagnostics" },
					lualine_y = { "fileformat", "filetype", "encoding", "progress" },
					lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
