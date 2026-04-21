return {
  {
    "crispgm/nvim-go",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "go",
    opts = {
      auto_format = true,
      auto_lint = true,
      maintain_cursor = true,
      formatter = "goimports", -- Adds missing imports + formats on save
    },
  },

  -- godoc.nvim: Professional documentation viewer
  {
    "fredrikaverpil/godoc.nvim",
    cmd = { "GoDoc" },
    ft = "go",
    opts = {},
  },
}
