return {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    keys = {
        {
            "<Leader>sr",
            function()
                require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Search/Replace in Current File",
        },
        {
            "<Leader>sR",
            function() require("grug-far").open({}) end,
            desc = "Search/Replace Project-wide",
        },
    },
}
