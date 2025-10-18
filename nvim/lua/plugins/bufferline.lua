-- lua/plugins/bufferline.lua

return {
  -- Main plugin for displaying bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    config = function()
      -- Configure appearance and options for bufferline
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          separator_style = "thin",
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "minifiles",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            }
          },
        }
      })

      -- =======================================================
      -- ADD KEYMAPS FOR BUFFER NAVIGATION HERE
      -- =======================================================
      -- Move to next buffer (right)
      vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { desc = "Next buffer", silent = true })
      -- Move to previous buffer (left)
      vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { desc = "Previous buffer", silent = true })

    end
  },

  -- Helper plugin to smartly "close" buffers
  {
    'echasnovski/mini.bufremove',
    config = function()
      vim.keymap.set("n", "<leader>c", function()
        require('mini.bufremove').delete(0, false)
      end, { desc = "Close current buffer" })
    end
  }
}
