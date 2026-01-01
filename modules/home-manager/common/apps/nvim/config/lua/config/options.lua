vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Required for statuscol.nvim lnumfunc
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.signcolumn = "no" -- Handled by statuscol.nvim
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 10000
opt.wrap = false
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldmethod = "expr"
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

local map = vim.keymap.set
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move to left window" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom window" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move to top window" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move to right window" })

-- Buffer management
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<CR>", { desc = "Switch to other buffer" })
map("n", "<leader>`", "<cmd>e #<CR>", { desc = "Switch to other buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
