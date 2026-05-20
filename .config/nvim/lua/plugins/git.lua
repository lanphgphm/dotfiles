return {
    -- Git UI (like Magit)
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        config = function()
            require("neogit").setup({
                integrations = {
                    gitsigns = true,
                },
            })
        end,
    },

    -- Inline gutter diff indicators
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                on_attach = function()
                    local gs = package.loaded.gitsigns
                    vim.keymap.set("n", "<leader>g]", gs.next_hunk) -- next changed line 
                    vim.keymap.set("n", "<leader>g[", gs.prev_hunk) -- prev changed line 
                    vim.keymap.set("n", "<leader>gp", gs.preview_hunk) -- see what the line looks like before change 
                    vim.keymap.set("n", "<leader>gr", gs.reset_hunk) -- undo the change / restore to what the line looked like before
                end,
            })
        end,
    },

    -- Fugitive for blame and quick git commands
    {
        "tpope/vim-fugitive",
        keys = {
            { "<Leader>gs", "<Cmd>Git<CR>", desc = "Git Status" },
            { "<Leader>gb", "<Cmd>Git blame<CR>", desc = "Git Blame" },
        },
    },
}
