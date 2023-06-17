-- options.lua: vim options

local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
	cursorline = true,
	signcolumn = "yes",
}

for opt, val in pairs(opts) do
	vim.o[opt] = val
end
