-- plugins.code_runner: code runner
return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				python = "python3 -u",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
				c = {
					"cd $dir &&",
					"gcc -o $fileNameWithoutExt -Wall -lm -O3 $file",
				},
			},
		})
	end,
}
