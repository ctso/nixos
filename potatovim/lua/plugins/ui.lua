return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
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
            "filename",
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn  = " ",
                info  = " ",
                hint  = " ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          },
          lualine_x = {
            {
              "diff",
              symbols = {
                added    = " ",
                modified = " ",
                removed  = " ",
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
            end
          },
        },
      };
    end,
  },

  -- mini.icons
  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {
    },
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
    }
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
}
