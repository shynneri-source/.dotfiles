return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        python = { "isort", "black" }, -- Sort imports, then format
        go = { "gofmt", "goimports" },
        rust = { "rustfmt" },
        -- C/C++ users usually rely on the LSP (clangd) for formatting, 
        -- but you can use "clang-format" here if you prefer.
      },
      -- Format on save settings
      format_on_save = {
        lsp_fallback = true, -- If no formatter is found, use the LSP (good for C/C++)
        async = false,
        timeout_ms = 500,
      },
    })

    -- Keybinding to manually format
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
