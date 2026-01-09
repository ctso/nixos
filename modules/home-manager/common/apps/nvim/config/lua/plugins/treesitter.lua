return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- Install common parsers automatically
			ts.install({
				"bash",
				"css",
				"diff",
				"dockerfile",
				"go",
				"gomod",
				"gosum",
				"html",
				"javascript",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"nix",
				"python",
				"regex",
				"rust",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"php",
				"proto",
			})

			-- Enable treesitter highlighting for all filetypes
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					-- Only start if a parser exists for this filetype
					if pcall(vim.treesitter.start) then
						-- Enable treesitter-based indentation
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter" },
	},
}
