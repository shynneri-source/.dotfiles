return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000, -- Load before all other plugins
        config = function()
            -- Default options:
            require('kanagawa').setup({
                compile = true,   -- Enable compiling the colorscheme for faster loading
                undercurl = true, -- Enable undercurls
                commentStyle = { italic = true },
                keywordStyle = { italic = true },
                transparent = false, -- Set to true if you want a transparent background
            })

            -- Apply the colorscheme
            vim.cmd.colorscheme("kanagawa")
        end,
    }
}
