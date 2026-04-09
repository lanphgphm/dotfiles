-- Leader key (must be set before plugins load)
vim.g.mapleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Undo and Filesystem behavior
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tab and Indentation 
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4

-- UI Tweaks
vim.opt.title = true
vim.opt.termguicolors = true -- Highly recommended for Catppuccin

-- Optional: Performance/UX tweaks for a "Pro" feel
vim.opt.updatetime = 250     -- Faster completion and diagnostic display
vim.opt.ignorecase = true    -- Ignore case in search patterns
vim.opt.smartcase = true     -- ...unless the search contains a capital letter
vim.opt.cursorline = true    -- Highlight the line the cursor is on 

-- Sync with system clipboard 
vim.opt.clipboard = "unnamedplus"

