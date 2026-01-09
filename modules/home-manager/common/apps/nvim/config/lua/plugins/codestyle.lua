return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "never",
			},
			notify_on_error = true,
			notify_no_formatters = true,
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "php_cs_fixer" },
				json = { "prettier" },
				terraform = { "terraform_fmt" },
				go = { "goimports", "gofmt" },
			},
			formatters = {
				php_cs_fixer = {
					command = "vendor/bin/php-cs-fixer",
					args = { "fix", "$FILENAME" },
					stdin = false,
				},
			},
		},
	},
}
