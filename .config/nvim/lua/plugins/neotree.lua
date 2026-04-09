return { 
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        window = {
            position = "left",
            width = 30,
            fixed_width = false,
        },
        filesystem = {
            follow_current_file = { enabled = true },
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    }
}
