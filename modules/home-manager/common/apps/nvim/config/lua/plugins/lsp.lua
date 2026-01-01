return {
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		-- merge keymaps per server rather than overwriting them
		opts_extend = { "servers.*.keys" },
		opts = function()
			local icons = require("config.icons").diagnostics
			local severity_names = { "ERROR", "WARN", "INFO", "HINT" }

			local severity_icons = {}
			for i, name in ipairs(severity_names) do
				severity_icons[i] = icons[name]
			end

			return {
				-- global diagnostic settings
				diagnostics = {
					underline = true,
					virtual_text = {
						spacing = 4,
						source = "if_many",
						prefix = function(diagnostic)
							return severity_icons[diagnostic.severity] or "●"
						end,
					},
					update_in_insert = false,
					severity_sort = true,
					signs = { text = severity_icons },
				},
				inlay_hints = {
					enabled = true,
				},
				-- default settings for all servers
				servers = {
					["*"] = {
						keys = {
							{ "gd", vim.lsp.buf.definition, desc = "Goto definition" },
							{ "gr", vim.lsp.buf.references, desc = "References" },
						},
					},
				},
			}
		end,
		config = function(_, opts)
			-- register diagnostic config
			vim.diagnostic.config(opts.diagnostics)
			-- define configs via vim.lsp.config()
			for server, conf in pairs(opts.servers) do
				if server ~= "*" then
					vim.lsp.config(server, conf)
				else
					vim.lsp.config("*", conf) -- global defaults
				end
			end
		end,
	},

	-- mason.nvim: installs external tools (formatters, linters, LSP servers)
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			-- tools (linters, formatters) to install
			-- LSPs should be installed via mason-lspconfig
			ensure_installed = {
				"stylua",
				"shfmt",
				"phpstan",
			},
		},
		config = function(_, opts)
			require("mason").setup()
			local registry = require("mason-registry")
			registry.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local pkg = registry.get_package(tool)
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
		end,
	},

	-- mason-lspconfig: ensures servers are installed via Mason and calls vim.lsp.enable()
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- list of LSP servers to install
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"copilot",
				"intelephense",
			},
			-- automatically call vim.lsp.enable() for installed servers (default true)
			automatic_enable = true,
		},
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
	},
}
