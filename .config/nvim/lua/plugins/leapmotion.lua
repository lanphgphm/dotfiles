return {
    url = "https://codeberg.org/andyg/leap.nvim",   
    config = function()
        require("leap").opts.safe_labels = ""
        vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
        vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    end,
}
