return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- 1. Setup Mason (Package Manager)
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "rust_analyzer",
        "gopls",
        "basedpyright",
        "marksman",
        "lua_ls",
      },
      automatic_installation = true,
    })

    -- 2. Global Keymaps (LspAttach)
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

        -- Enable Inlay Hints if available
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end
      end,
    })

    -- 3. Define Capabilities (Disable Auto-Import)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
      },
    }

    local servers = { "clangd", "rust_analyzer", "gopls", "basedpyright", "marksman", "lua_ls" }

    for _, server in ipairs(servers) do
      local config = { capabilities = capabilities }

      -- Server-specific settings
      if server == "clangd" then
        config.capabilities.offsetEncoding = { "utf-16" }
      end

      if server == "lua_ls" then
        config.settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        }
      end

      if server == "basedpyright" then
        config.settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        }
      end

     vim.lsp.config(server, config)
      
    end
  end,
}
