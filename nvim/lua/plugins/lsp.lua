return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/lazydev.nvim", -- The "best" Lua dev plugin (replaces neodev)
        },
        config = function()
            -- 1. Setup Mason (The Package Manager for LSPs)
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            -- 2. Define the servers we want to ensure are installed
            local servers = {
                clangd = {},
                gopls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                },
                rust_analyzer = {},
                -- Python: The "Best" Combo
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoImportCompletions = true, -- We can filter this in cmp if needed
                            },
                        },
                    },
                },
                ruff = {}, -- Extremely fast linter/formatter
            }

            -- 3. Ensure they are installed via Mason-LSPConfig
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            -- 4. The  configuration
            for name, config in pairs(servers) do
                config.capabilities = require("cmp_nvim_lsp").default_capabilities()

                -- Setup specific handlers
                if name == "basedpyright" then
                elseif name == "ruff" then
                    config.on_attach = function(client, _)
                        client.server_capabilities.hoverProvider = false
                    end
                end

                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end
            -- 5. Cosmetic: Better UI for diagnostics
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●", -- Could be '■', '●'
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "▲",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "»",
                    },
                },
                update_in_insert = false, -- Clean UI while typing
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "if_many",
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
}
