return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VimEnter",
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[                                                 ]],
                [[                                                 ]],
                [[   _____ __                                    _ ]],
                [[  / ___// /_  __  ______  ____  ___  _____  (_) ]],
                [[  \__ \/ __ \/ / / / __ \/ __ \/ _ \/ ___/ / /  ]],
                [[ ___/ / / / / /_/ / / / / / / /  __/ /    / /   ]],
                [[/____/_/ /_/\__, /_/ /_/_/ /_/\___/_/    /_/    ]],
                [[           /____/                               ]],
                [[                                                 ]],
            }

            -- Set the header color to a cool Kanagawa Blue/Violet
            dashboard.section.header.opts.hl = "Keyword"

            -- Define the buttons
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
                dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
                dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
                dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "  Quit", ":qa<CR>"),
            }

            -- Footer (Optional: Show plugin count)
            local function footer()
                return "shynneri"
            end
            dashboard.section.footer.val = footer()
            dashboard.section.footer.opts.hl = "Type"

            -- Layout customization (Padding)
            dashboard.section.header.opts.position = "center"
            dashboard.section.buttons.opts.position = "center"
            dashboard.section.footer.opts.position = "center"

            require("alpha").setup(dashboard.config)
        end,
    }
}
