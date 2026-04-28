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

        -- rust_analyzer is managed by rustaceanvim plugin

        -- Enable the relevant server when open a file
        vim.lsp.enable({ "gopls", "clangd" })
    end
}
