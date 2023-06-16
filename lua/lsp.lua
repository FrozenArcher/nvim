require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pylsp",
    },
    automatic_installation = true,
})

-- Neodev setup before LSP config
require("neodev").setup()

-- Turn on LSP status information
--require("fidget").setup()

-- Set up cool signs for diagnostics
local signs = { Error = " ", Warn = "⚠ ", Hint = " ", Info = " " }
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
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

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
    settings = {
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = true,
                },
            },
        },
    },
})
