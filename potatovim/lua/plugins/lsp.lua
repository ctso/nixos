return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "stylua" },
    },
    config = function(_, opts)
      require("mason").setup()
      -- install specified tools
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
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
      },
      automatic_enable = true,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
  },
  { "neovim/nvim-lspconfig" },
}
