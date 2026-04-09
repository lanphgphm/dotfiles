return {
    "neovim/nvim-lspconfig",
    dependencies = { "Saghen/blink.cmp" },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        vim.lsp.config.gopls = {
            capabilities = capabilities,
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    deepCompletion = true, 
                },
            },
        }

        vim.lsp.config.clangd = { 
            capabilities = capabilities, 
        }

        vim.lsp.config.rust_analyzer = {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = { 
                    cargo = { allFeatures = true }, 
                    procMacro = { enable = true },
                }
            }
        }

        -- Enable the relevant server when open a file
        vim.lsp.enable({ "gopls", "clangd", "rust_analyzer" })
    end
}
