return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		-- Normal mode
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
		-- Terminal mode
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "t", desc = "Navigate Left" },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", mode = "t", desc = "Navigate Down" },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", mode = "t", desc = "Navigate Up" },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", mode = "t", desc = "Navigate Right" },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = "t", desc = "Navigate Previous" },
	},
}
