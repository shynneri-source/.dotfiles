return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer", -- Buffer source
        "hrsh7th/cmp-path", -- Path source
        "L3MON4D3/LuaSnip", -- Snippet engine
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),

                ['<CR>'] = cmp.mapping(function(fallback)
                    fallback()
                end, { "i", "s" }),

                ['<Tab>'] = cmp.mapping.confirm({ select = true }),

                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })
    end,
}
