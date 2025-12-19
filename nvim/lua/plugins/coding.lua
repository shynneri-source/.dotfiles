return {

  -- 1. Auto-Pairs (highly recommended)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- better with treesitter
        fast_wrap = {},
      })
    end,
  },

  -- 2. Signature Help
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach", -- better than InsertEnter (attach per buffer)
    opts = {
      bind = true,
      doc_lines = 8, -- slightly smaller

      floating_window = true,
      floating_window_above_cur_line = true,
      fix_pos = false,

      hint_enable = true,
      hint_prefix = "➜ ", 
      hint_scheme = "String",

      handler_opts = {
        border = "rounded",
      },

      zindex = 50,
      padding = "", 
      transparency = 15,

      always_trigger = false,
      extra_trigger_chars = { "(", "," },

      toggle_key = "<C-k>",
      select_signature_key = "<C-n>",
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },

}
