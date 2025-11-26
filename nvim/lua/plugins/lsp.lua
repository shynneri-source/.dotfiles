return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- 1. Setup Mason (Installs the binaries)
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "rust_analyzer",
                "gopls",
                "pyright",
                "ts_ls",
                "marksman",
                "lua_ls",
            },
            automatic_installation = true,
        })

        -- 2. Global Keymaps (The New "on_attach")
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
            end,
        })

        -- 3. Enable Servers (The New "vim.lsp.enable")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- List of servers to enable
        local servers = { "clangd", "rust_analyzer", "gopls", "pyright", "ts_ls", "marksman", "lua_ls" }

        for _, server in ipairs(servers) do
            -- Apply capabilities (autocomplete) to the server config
            -- In 0.11, we patch the config BEFORE enabling
            local config = { capabilities = capabilities }

            -- Specific Fix: C++ (clangd) needs utf-16 encoding
            if server == "clangd" then
                config.capabilities.offsetEncoding = { "utf-16" }
            end

            -- Specific Fix: Lua needs global 'vim'
            if server == "lua_ls" then
                config.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
            end

            -- 4. Apply Config & Enable
            -- This uses the new Native 0.11 API, bypassing the deprecated 'framework'
            if vim.lsp.config then
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            else
                -- Fallback for slightly older nightly builds, just in case
                require("lspconfig")[server].setup(config)
            end
        end
    end,
}
