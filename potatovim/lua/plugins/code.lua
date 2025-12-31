return {
	-- automatically add matching pairs, ie () [] ""
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better support for markdown
			markdown = true,
		},
	},

	-- Enhances native comments, more language support, relaxed rules, etc
	{ "folke/ts-comments.nvim" },

	-- Better support for editing Neovim configs
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "*",
		opts_extend = {
			"sources.completion.enabled_providers",
			"sources.compat",
			"sources.default",
		},
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"saghen/blink.compat",
				optional = true,
				opts = {},
				version = "*",
			},
			{
				"fang2hou/blink-copilot",
				options = {
					max_completions = 1,
					max_attempts = 2,
				},
			},
		},
		opts = {
			snippets = {
				preset = "default",
			},

			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},

			completion = {
				accept = {
					auto_brackets = { enabled = true },
				},
				menu = {
					draw = { treesitter = { "lsp" } },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = true,
				},
			},

			sources = {
				compat = {},
				-- default = { "lsp", "path", "snippets", "buffer" },
				default = { "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
						opts = {
							max_completions = 3,
						},
					},
				},
			},

			keymap = {
				preset = "super-tab",
				["<Tab>"] = {
					function(cmp)
						if vim.b[vim.api.nvim_get_current_buf()].nes_state then
							cmp.hide()
							return (
								require("copilot-lsp.nes").apply_pending_nes()
								and require("copilot-lsp.nes").walk_cursor_end_edit()
							)
						end
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
			},
		},
	},
}
