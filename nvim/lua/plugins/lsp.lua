return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/lazydev.nvim",
            "hrsh7th/cmp-nvim-lsp", -- Ensure this is here for capabilities
        },
        config = function()
            -- 1. Setup Mason
            require("mason").setup({
                ui = { border = "rounded" }
            })

            -- 2. Define Servers & Custom Settings
            local servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--header-insertion=never" -- ⛔ Disables auto-import
                    },
                    root_markers = { ".git", ".clangd", "compile_commands.json", "compile_flags.txt" },
                },

                -- Python: Disable Auto-Import
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoImportCompletions = false, -- ⛔ Disables auto-import
                            },
                        },
                    },
                },

                -- Go: Disable Unimported Completion
                gopls = {
                    settings = {
                        gopls = {
                            completeUnimported = false, -- ⛔ Disables auto-import
                            usePlaceholders = true,
                        },
                    },
                },

                -- Rust: Disable Auto-Import
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            completion = {
                                autoimport = { enable = false }, -- ⛔ Disables auto-import
                            },
                        },
                    },
                },

                -- Lua: Disable Auto-Require
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { autoRequire = false }, -- ⛔ Disables auto-import
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                },

                -- Ruff: Disable Hover
                ruff = {
                    on_attach = function(client, _)
                        client.server_capabilities.hoverProvider = false
                    end,
                },
            }

            -- 3. Install Servers via Mason
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            -- 4. Native Neovim 0.11 Configuration Loop
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for name, opts in pairs(servers) do
                opts.capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities or {})

                vim.lsp.config(name, opts)
                vim.lsp.enable(name)
            end

            -- 5. Diagnostics UI
            vim.diagnostic.config({
                virtual_text = { prefix = "●" },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "▲",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "»",
                    },
                },
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = { border = "rounded", source = "if_many" },
            })
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
}
