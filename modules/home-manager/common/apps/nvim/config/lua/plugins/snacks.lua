return {
	"folke/snacks.nvim",
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			layout = { preset = "ivy" },
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = {
			enabled = true,
			win = {
				keys = {
					nav_h = {
						"<c-h>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateLeft")
						end,
						desc = "Navigate Left",
						mode = "t",
					},
					nav_j = {
						"<c-j>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateDown")
						end,
						desc = "Navigate Down",
						mode = "t",
					},
					nav_k = {
						"<c-k>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateUp")
						end,
						desc = "Navigate Up",
						mode = "t",
					},
					nav_l = {
						"<c-l>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateRight")
						end,
						desc = "Navigate Right",
						mode = "t",
					},
				},
			},
		},
		toggle = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>tf",
			function()
				Snacks.terminal(nil, { win = { position = "float" } })
			end,
			desc = "Floating Terminal",
		},
		{
			"<leader>th",
			function()
				Snacks.terminal(nil, { win = { position = "bottom" } })
			end,
			desc = "Horizontal Terminal",
		},
	},
}
