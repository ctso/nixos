return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		opts_extend = { "ensure_installed" },
		opts = {
			auto_install = true,
			ensure_installed = "all",
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
		},
	},
}
