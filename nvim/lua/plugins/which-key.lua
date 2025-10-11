-- File: lua/plugins/which-key.lua

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- Add nvim-web-devicons as dependency to ensure icons load in correct order
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require("which-key").setup({
      -- Changed from 'window' to 'win'
      win = {
        border = "rounded",
        padding = { 1, 2, 1, 2 }, -- Reduce padding a bit for cleaner look
      },
      layout = {
        spacing = 4,
      },
    })
  end,
}
