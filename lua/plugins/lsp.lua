-- plugins.lsp: lspconfig, mason
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			--"j-hui/fidget.nvim",
            { "folke/neodev.nvim", opts = {} },
			"RRethy/vim-illuminate",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Set up Mason before anything else
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"rust_analyzer",
					"gopls",
				},
				automatic_installation = true,
			})

            -- vim-illuminate
            require("illuminate").configure({
                 providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
            })
            vim.cmd("hi def IlluminatedWordText gui=underline")
            vim.cmd("hi def IlluminatedWordRead gui=underline")
            vim.cmd("hi def IlluminatedWordWrite gui=underline")

			-- Quick access via keymap
			require("utils.keys").nmap("<leader>m", "<cmd>Mason<cr>")

			-- Turn on LSP status information
			--require("fidget").setup()

			-- setup nvim-navic
			require("nvim-navic").setup({
				separator = " > ",
				depth_limit = 3,
				depth_limit_indicator = "..",
				lsp = {
					auto_attach = true,
				},
			})

			-- Set up cool signs for diagnostics
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Diagnostic config
			local config = {
				virtual_text = false,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)

			-- This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(client, bufnr)
				local lsp_map = require("helpers.keys").lsp_map

				lsp_map("<leader>cr", vim.lsp.buf.rename, bufnr, "Rename symbol")
				lsp_map("<leader>ca", vim.lsp.buf.code_action, bufnr, "Code action")
				lsp_map("<leader>cd", vim.lsp.buf.type_definition, bufnr, "Type definition")
				lsp_map("<leader>cs", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

				lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
				lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
				lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
				lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
				lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })

				lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")

				-- Attach and configure vim-illuminate
				require("illuminate").on_attach(client)
			end

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Lua
			require("lspconfig")["lua_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- Python
			require("lspconfig")["pyright"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
