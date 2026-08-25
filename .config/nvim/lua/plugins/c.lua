return {
  {
    "stevearc/conform.nvim",
    enabled = false,
    ft = { "c", "cpp", "objc", "objcpp" },
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        objc = { "clang-format" },
        objcpp = { "clang-format" },
      },
      formatters = { 
        ["clang-format"] = {
          -- prepend_args = { "--style=file" },
          prepend_args = { "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format" },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
