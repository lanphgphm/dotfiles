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
