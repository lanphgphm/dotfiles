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
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders=true",
                -- Let clangd query the cross-compiler for system-header
                -- and builtin paths. Broad pattern covers nixpkgs
                -- riscv32-none-elf toolchain plus common gcc cross-tools.
                "--query-driver=/nix/store/*/bin/riscv32-*-gcc,/nix/store/*/bin/*-elf-gcc,/usr/bin/*-elf-gcc",
            },
        }

        -- rust_analyzer is managed by rustaceanvim plugin

        -- Enable the relevant server when open a file
        vim.lsp.enable({ "gopls", "clangd" })
    end
}
