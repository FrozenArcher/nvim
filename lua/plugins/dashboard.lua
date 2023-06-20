-- plugins.dashboard: startup dashboard
return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	opts = {
		theme = "hyper",
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
