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
			vim.g.copilot_nes_debounce = 500
			vim.lsp.enable("copilot_ls")

			-- Clear copilot suggestion with Esc if visible
			vim.keymap.set("n", "<esc>", function()
				if not require("copilot-lsp.nes").clear() then
					-- fallback: clear search highlight
					vim.cmd("nohlsearch")
				end
			end, { desc = "Clear Copilot NES or search highlight" })
		end,
		config = function()
			vim.api.nvim_set_hl(0, "CopilotNesHint", { fg = "#7aa2f7", italic = true })
			vim.api.nvim_set_hl(0, "CopilotNesDiff", { fg = "#9ece6a", bg = "#1a1b26" })
		end,
	},
}
