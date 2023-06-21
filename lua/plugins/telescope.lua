-- plugins.telescope: file finder
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("telescope").setup()
	end,
}
