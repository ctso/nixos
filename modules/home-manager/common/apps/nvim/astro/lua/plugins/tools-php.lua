-- Custom PHP Pack

---@type LazySpec
return {
    -- treesitter support
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "php",
          "phpdoc",
        },
      },
    },
  
    -- install tools with mason
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "php-cs-fixer",
          "intelephense",
        },
      },
    },
  
    -- Configure conform to use php_cs_fixer
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          php = { "php_cs_fixer" },
        },
      },
    },
  }