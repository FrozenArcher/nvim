-- keymap.lua: keymap settings

local map = require("utils.keys").map
local nmap = require("utils.keys").nmap

-----------------------
-- UI Window keymaps --
-----------------------
-- Lazy
nmap("<leader>wl", function()
	require("lazy").show()
end, "Open Lazy.nvim window")
-- Floating terminal
map({ "n", "t" }, "<leader>wt", "<cmd>Lspsaga term_toggle<CR>", "Toggle floating terminal")
-- Mason
nmap("<leader>wm", "<cmd>Mason<cr>", "Open Mason window")
-- Trouble
nmap("<leader>wx", "<cmd>TroubleToggle<cr>", "Open Trouble window")
-- Neogit
nmap("<leader>wg", function()
	require("neogit").open()
end, "Open Neogit window")
-- Lspsaga outline window
map("n", "<leader>wo", "<cmd>Lspsaga outline<CR>", "Open Lspsaga outline window")

-------------
-- Plugins --
-------------
-- Hop
nmap("fc", "<cmd>HopChar1<cr>", "Hop 1 char")
nmap("fC", "<cmd>HopChar2<cr>", "Hop 2 chars")
nmap("fw", "<cmd>HopWord<cr>", "Hop word")
nmap("fl", "<cmd>HopLine<cr>", "Hop line")
nmap("fp", "<cmd>HopPattern<cr>", "Hop pattern")
-- NeoTree
nmap("<leader>a", "<cmd>NeoTreeFocus<cr>", "Fucus on NeoTree")
-- Bufferline
nmap("<A-j>", ":BufferLineCycleNext<cr>", "Cycle to next buffer")
nmap("<A-k>", ":BufferLineCyclePrev<cr>", "Cycle to previous buffer")
-- Close buffer
nmap("<leader>cb", function()
	require("close_buffers").delete({ type = "this" })
end, "Close this buffer")
nmap("<leader>ch", function()
	require("close_buffers").delete({ type = "hidden" })
end, "Close hidden buffer")
nmap("<leader>ca", function()
	require("close_buffers").wipe({ type = "all", force = true })
end, "Close hidden buffer")
nmap("<leader>co", function()
	require("close_buffers").wipe({ type = "other" })
end, "Close other buffer except current focused")
-- Telescope
local builtin = require("telescope.builtin")
nmap("<leader>ff", builtin.find_files, "Find file")
nmap("<leader>fg", builtin.live_grep, "Live grep")
nmap("<leader>fb", builtin.buffers, "Find buffer")
nmap("<leader>fh", builtin.help_tags, "Help tags")
nmap("<leader>fp", function()
	require("telescope").extensions.projects.projects({})
end, "Find projects")
-- Spectre
local spectre = require("spectre")
nmap("<leader>ss", function()
	spectre.open()
end, "Open spectre")
nmap("<leader>sw", function()
	spectre.open_visual({ select_word = true })
end, "Search current word")
map("v", "<leader>sw", function()
	spectre.open_visual()
end, "Search current word")
nmap("<leader>sp", function()
	spectre.open_file_search({ select_word = true })
end, "Search on current file")

----------------------
-- LSP code actions --
----------------------
-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
map("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", "Find references")
-- Code action
map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>", "Code action")
-- Rename all occurrences of the hovered word for the entire file
map("n", "<leader>lrf", "<cmd>Lspsaga rename<CR>", "Rename symble in file")
-- Rename all occurrences of the hovered word for the selected files
map("n", "<leader>lrp", "<cmd>Lspsaga rename ++project<CR>", "Rename symble in project")
-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", "Peek definition")
-- Go to definition
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "Goto definition")
-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
--map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", "Peek type definition")
-- Go to type definition
map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", "Show diagnostics of current line")
-- Show buffer diagnostics
map("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show diagnostics of current buffer")
-- Show workspace diagnostics
map("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Show diagnostics in current workspace")
-- Show cursor diagnostics
map("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show diagnostics under cursor")
-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Goto previous diagnostic")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Goto next diagnostic")
-- Diagnostic jump with filters such as only jumping to an error
map("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, "Goto previous error")
map("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, "Goto next error")
-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Document hover window")
-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
--map("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", "Document hover window")
-- Call hierarchy
map("n", "<Leader>lci", "<cmd>Lspsaga incoming_calls<CR>", "Lspsaga incoming_calls")
map("n", "<Leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", "Lspsaga outgoing_calls")
