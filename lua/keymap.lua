-- keymap.lua: basic keymap

local map = require("utils.keys").map
local nmap = require("utils.keys").nmap

nmap("<leader>cb", function()
	vim.cmd.bdelete()
	vim.cmd.bnext()
end, "Close current buffer")
