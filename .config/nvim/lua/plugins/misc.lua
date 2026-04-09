return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.diff").setup({})
        require("mini.bufremove").setup({})
        require("mini.surround").setup({
            mappings = {
                add = "gz",
                delete = "dz",
                replace = "rz",
            },
        })
    end,
    keys = {
        { "<Leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete Buffer" },
        { "<Leader>go", function() require("mini.diff").toggle_overlay() end, desc = "Toggle Git Diff Overlay" },
    },
}
