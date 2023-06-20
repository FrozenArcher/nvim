-- plugins.lspsaga: lsp helper

return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		require("lspsaga").setup({})
		local map = require("utils.keys").map
		-- LSP finder - Find the symbol's definition
		-- If there is no definition, it will instead be hidden
		-- When you use an action in finder like "open vsplit",
		-- you can use <C-t> to jump back
		map("n", "gh", "<cmd>lspsaga lsp_finder<cr>")
		-- Code action
		map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

		-- Rename all occurrences of the hovered word for the entire file
		map("n", "gr", "<cmd>Lspsaga rename<CR>")

		-- Rename all occurrences of the hovered word for the selected files
		map("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

		-- Peek definition
		-- You can edit the file containing the definition in the floating window
		-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
		-- It also supports tagstack
		-- Use <C-t> to jump back
		map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

		-- Go to definition
		map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

		-- Peek type definition
		-- You can edit the file containing the type definition in the floating window
		-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
		-- It also supports tagstack
		-- Use <C-t> to jump back
		--map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

		-- Go to type definition
		map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

		-- Show line diagnostics
		-- You can pass argument ++unfocus to
		-- unfocus the show_line_diagnostics floating window
		map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

		-- Show buffer diagnostics
		map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

		-- Show workspace diagnostics
		map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

		-- Show cursor diagnostics
		map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

		-- Diagnostic jump
		-- You can use <C-o> to jump back to your previous location
		map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

		-- Diagnostic jump with filters such as only jumping to an error
	    map("n", "[E", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		map("n", "]E", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)

		-- Toggle outline
		map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

		-- Hover Doc
		-- If there is no hover doc,
		-- there will be a notification stating that
		-- there is no information available.
		-- To disable it just use ":Lspsaga hover_doc ++quiet"
		-- Pressing the key twice will enter the hover window
		map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

		-- If you want to keep the hover window in the top right hand corner,
		-- you can pass the ++keep argument
		-- Note that if you use hover with ++keep, pressing this key again will
		-- close the hover window. If you want to jump to the hover window
		-- you should use the wincmd command "<C-w>w"
		--map("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

		-- Call hierarchy
		map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
		map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

		-- Floating terminal
		map({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<CR>")
	end,
}
