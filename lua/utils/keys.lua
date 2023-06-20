local M = {}

M.map = function(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

M.nmap = function(key, action)
	M.map("n", key, action)
end

M.lsp_map = function(lhs, rhs, bufnr)
	vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr })
end

M.dap_map = function(mode, lhs, rhs)
	M.map(mode, lhs, rhs)
end

M.set_leader = function(key)
	vim.g.mapleader = key
	vim.g.maplocalleader = key
	M.map({ "n", "v" }, key, "<nop>")
	-- M.map({ "n", "v" }, "<leader>L", ':echo "leader pressed"<cr>')
end

return M
