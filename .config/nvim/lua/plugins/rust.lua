return {
  -- rustaceanvim: Enhanced Rust tooling (successor to rust-tools.nvim)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    keys = {
      { "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, desc = "Rust Code Action", ft = "rust" },
      { "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, desc = "Rust Debuggables", ft = "rust" },
      { "<leader>rr", function() vim.cmd.RustLsp("runnables") end, desc = "Rust Runnables", ft = "rust" },
      { "<leader>rt", function() vim.cmd.RustLsp("testables") end, desc = "Rust Testables", ft = "rust" },
      { "<leader>re", function() vim.cmd.RustLsp("explainError") end, desc = "Explain Error", ft = "rust" },
      { "<leader>rm", function() vim.cmd.RustLsp("expandMacro") end, desc = "Expand Macro", ft = "rust" },
      { "<leader>rp", function() vim.cmd.RustLsp("parentModule") end, desc = "Parent Module", ft = "rust" },
      { "J", function() vim.cmd.RustLsp("joinLines") end, desc = "Join Lines", ft = "rust" },
    },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          float_win_config = {
            border = "rounded",
          },
        },
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              procMacro = { enable = true },
              checkOnSave = { command = "clippy" },
              inlayHints = {
                chainingHints = { enable = true },
                typeHints = { enable = true },
                parameterHints = { enable = true },
              },
            },
          },
        },
      }
    end,
  },

  -- crates.nvim: Manage Cargo.toml dependencies
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        cmp = { enabled = false },
        crates = { enabled = true },
      },
    },
  },
}
