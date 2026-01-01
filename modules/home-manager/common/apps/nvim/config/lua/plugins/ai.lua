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

	{
		"copilotlsp-nvim/copilot-lsp",
		init = function()
			-- NES disabled - only using blink.cmp integration
			vim.g.copilot_nes_debounce = 500
			vim.lsp.enable("copilot_ls")
		end,
		opts = {
			nes = { enabled = false },
		},
	},
}
