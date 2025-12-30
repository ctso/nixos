return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
    },
    picker = {
      enabled = true,
      layout = { preset = "ivy" },
    },
  },
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = 'Find with Grep' },
    { "<leader>gg", function() Snacks.lazygit() end, desc = 'Lazygit' },
  },
}
