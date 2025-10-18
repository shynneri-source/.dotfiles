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
        mappings = {
          close       = 'q',
          go_in       = 'l',
          go_in_plus  = 'L',
          go_out      = 'h',
          go_out_plus = 'H',
          reset       = '<BS>',
          reveal_cwd  = '@',
          show_help   = 'g?',
          synchronize = 'S',  -- Changed to S for save/sync
          trim_left   = '<',
          trim_right  = '>',
        },
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
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
