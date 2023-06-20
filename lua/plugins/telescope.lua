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
		local builtin = require("telescope.builtin")
		local nmap = require("utils.keys").nmap
		nmap("<leader>ff", builtin.find_files, "Find file")
		nmap("<leader>fg", builtin.live_grep, "Live grep")
		nmap("<leader>fb", builtin.buffers, "Find buffer")
		nmap("<leader>fh", builtin.help_tags, "Help tags")
	end,
}
