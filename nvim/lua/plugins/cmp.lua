return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source
            "hrsh7th/cmp-buffer",   -- Buffer source
            "hrsh7th/cmp-path",     -- Path source
            "L3MON4D3/LuaSnip",     -- Snippet engine
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets", -- Useful snippets
            "ray-x/lsp_signature.nvim",     -- Function signatures
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            require("lsp_signature").setup({
                bind = true,
                handler_opts = {
                    border = "rounded"
                },
                hint_enable = false, -- Disable the virtual text hint (cleaner UI)
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
               completion = {
                    completeopt = "menu,menuone,noselect", 
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), 
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
                -- Cosmetic: Use icons for Kind (Method, Variable, etc)
                formatting = {
                    format = function(entry, vim_item)
                        -- Fancy icons
                        local icons = {
                            Text = "", Method = "󰆧", Function = "󰊕", Constructor = "",
                            Field = "󰇽", Variable = "󰂡", Class = "󰠱", Interface = "",
                            Module = "", Property = "󰜢", Unit = "", Value = "󰎠",
                            Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
                            File = "󰈙", Reference = "", Folder = "󰉋", EnumMember = "",
                            Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
                            TypeParameter = "󰅲",
                        }
                        vim_item.kind = string.format("%s %s", icons[vim_item.kind] or "", vim_item.kind)
                        return vim_item
                    end,
                },
            })
        end,
    }
}
