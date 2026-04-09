return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        winopts = {
            height     = 0.40, -- 40% height
            width      = 0.80,
            row        = 0.35,
            preview    = {
                layout = 'vertical',
                vertical = 'down:50%',
            },
        },
        fzf_opts = {
            ['--layout'] = 'reverse',
            ['--info']   = 'inline-right', -- cleaner look
        },
        files = {
            -- ripgrep command for hidden files
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
            fd_opts = "--color=never --type f --hidden --follow --exclude .git",
            cwd_prompt = true, 
        },
        grep = {
            cwd_prompt = true,
        },
    },
    keys = {
        { "<Leader>/", "<cmd>FzfLua files<CR>",   desc = "Find file name" },
        { "<Leader>,",        "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
        { "<Leader><Leader>",        "<cmd>FzfLua live_grep<CR>", desc = "Fulltext search in project" },
    },
}
