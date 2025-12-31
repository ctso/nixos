return {
	"folke/snacks.nvim",
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		input = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		toggle = { enabled = true },
		words = { enabled = true },
		picker = {
			enabled = true,
			layout = { preset = "ivy" },
		},
		statuscolumn = {
			enabled = true,
		},
		terminal = {
			enabled = true,
		},
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
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find with Grep",
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
			desc = "git branches",
		},
	},
}
