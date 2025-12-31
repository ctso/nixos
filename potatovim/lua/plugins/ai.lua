return {
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			{
				"folke/snacks.nvim",
				opts = { input = { enabled = true }, picker = { enabled = true }, terminal = { enabled = true } },
			},
		},
		config = function()
			vim.g.opencode_opts = {
				-- opencode custom config
			}

			-- Required for `opts.events.reload`
			vim.o.autoread = true

			-- Keymaps
			vim.keymap.set({ "n", "x" }, "<leader>ai", function()
				require("opencode").toggle()
			end, { desc = "Toggle Opencode" })
		end,
	},
}
