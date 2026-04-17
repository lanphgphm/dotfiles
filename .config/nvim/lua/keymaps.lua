local map = vim.keymap.set

-- Stay in visual mode after indenting
map("v", "<Tab>", ">gv", { desc = "Indent right" })
map("v", "<S-Tab>", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<", "<gv", { desc = "Indent left" })

-- LSP Navigation (GoLand Style)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "List Usages (References)" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Temporarily highlight split separator when jumping to definition
local function goto_definition_split(split_cmd, hl_color)
  -- Set bright separator color
  local original_hl = vim.api.nvim_get_hl(0, { name = "WinSeparator" })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = hl_color or "#f34a00", bg = "NONE" })
  
  vim.cmd(split_cmd)
  vim.lsp.buf.definition()
  
  -- Reset after 2 seconds
  vim.defer_fn(function()
    vim.api.nvim_set_hl(0, "WinSeparator", original_hl)
  end, 2000)
end

map("n", "gs", function()
  goto_definition_split("vsplit", "#f34a00")  -- Orange cursor color
end, { desc = "Go to Definition in Vertical Split" })

map("n", "<leader>q", "<C-w>c", { desc = "Close current window/split" })

vim.keymap.set('n', '<S-e>', vim.diagnostic.open_float)
