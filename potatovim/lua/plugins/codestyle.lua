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
			},
		},
	},
}
