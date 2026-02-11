return {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
        return {
            symbol = "│",
            draw = {
                animation = require("mini.indentscope").gen_animation.none(),
            },
            options = {
                try_as_border = true,
            },
        }
    end,
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#7e7e7e", nocombine = true })
            end,
        })
    end,
}
