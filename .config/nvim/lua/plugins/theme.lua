return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = false,
    integrations = {
      -- Standard Integrations
      blink_cmp = true,
      fzf = true,
      grug_far = true,
      leap = true,
      mini = true,
      neotree = true,
      treesitter = true,
      which_key = true,
      indent_blankline = { enabled = true },
      
      -- Native LSP styling handled within the theme
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "none" },
          warnings = { "none" },
          information = { "none" },
        },
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#fab387", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#fab387", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "HorizSplit", { fg = "#fab387", bg = "NONE", bold = true })

    -- Minimal diagnostic setup: Icons for errors only
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "E",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
    })
  end,
}
