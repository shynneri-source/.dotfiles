return {
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },

  -- File explorer
  {
    "echasnovski/mini.files",
    version = "*",
    config = function()
      require("mini.files").setup({
        -- Configuration options for mini.files
      })
      -- Keymap to open mini.files
      vim.keymap.set("n", "<leader>e", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = "Open mini.files (current dir)" })
      vim.keymap.set("n", "<leader>E", function()
        require("mini.files").open(vim.fn.getcwd(), true)
      end, { desc = "Open mini.files (cwd)" })
    end,
  },
}
