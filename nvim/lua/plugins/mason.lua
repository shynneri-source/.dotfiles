-- lua/plugins/mason.lua

return {
  -- Mason itself
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Bridge between Mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright", "gopls" },
        handlers = nil, -- Handlers will be set up in lsp.lua
      })
    end,
  },
  -- Tool installer for formatters, etc.
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "ruff", "clang-format", "gofumpt", "stylua" },
      })
    end,
  },
}
