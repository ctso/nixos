return {
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return {
				options = {
					theme = "auto",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", padding = { left = 0, right = 1 } },
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = " ",
							},
						},
					},
					lualine_x = {
						-- LSP clients
						{
							function()
								local clients = vim.lsp.get_clients({ bufnr = 0 })
								if #clients == 0 then
									return ""
								end
								local exclude = { copilot = true, copilot_ls = true }
								local names = {}
								for _, client in ipairs(clients) do
									if not exclude[client.name] then
										table.insert(names, client.name)
									end
								end
								if #names == 0 then
									return ""
								end
								return " " .. table.concat(names, ", ")
							end,
						},
						-- Conform formatters
						{
							function()
								local ok, conform = pcall(require, "conform")
								if not ok then
									return ""
								end
								local formatters = conform.list_formatters_for_buffer(0)
								if #formatters == 0 then
									return ""
								end
								return " " .. table.concat(formatters, ", ")
							end,
						},
						{
							"diff",
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end,
						},
					},
					lualine_y = { "progress", "location" },
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
			}
		end,
	},

	-- mini.icons
	{
		"nvim-mini/mini.icons",
		lazy = true,
		opts = {},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			spec = {
				{
					mode = { "n", "x" },
					{ "<leader>g", group = "git" },
					{ "<leader>f", group = "find" },
				},
			},
		},
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
	},

	-- trouble.nvim
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		},
	},

	-- snacks dashboard
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				enabled = true,
				preset = {
					header = "buttervim 🧈",
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
		},
	},
}
