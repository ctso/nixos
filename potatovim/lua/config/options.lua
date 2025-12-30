vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Show line numbers
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.signcolumn = "yes" -- Always show sign gutter to avoid layout shifts
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 10000
opt.wrap = false
