return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        config = function()
            require("conform").setup({
                -- Define formatters
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "ruff_format", "ruff_fix" }, -- Run formatter and import organizer
                    
                    -- Use the "*" filetype to run formatters on all filetypes.
                    -- Use the "_" filetype to run formatters on filetypes that don't
                    -- have other formatters configured.
                    ["_"] = { "trim_whitespace" },
                },
                
                -- Set default options
                default_format_opts = {
                    lsp_format = "fallback", -- Use LSP if no dedicated formatter (Good for Rust/Go/C++)
                },

                -- Format on save
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
    }
}
