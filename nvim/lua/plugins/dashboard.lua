return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        -- 1. HEADER
        dashboard.section.header.val = {
            [[                                                                                ]],
            [[           ▄▄                                                             ██    ]],
            [[           ██                                                             ▀▀    ]],
            [[ ▄▄█████▄  ██▄████▄  ▀██  ███  ██▄████▄  ██▄████▄   ▄████▄    ██▄████   ████    ]],
            [[ ██▄▄▄▄ ▀  ██▀   ██   ██▄ ██   ██▀   ██  ██▀   ██  ██▄▄▄▄██   ██▀         ██    ]],
            [[  ▀▀▀▀██▄  ██    ██    ████▀   ██    ██  ██    ██  ██▀▀▀▀▀▀   ██          ██    ]],
            [[ █▄▄▄▄▄██  ██    ██     ███    ██    ██  ██    ██  ▀██▄▄▄▄█   ██       ▄▄▄██▄▄▄ ]],
            [[  ▀▀▀▀▀▀   ▀▀    ▀▀     ██     ▀▀    ▀▀  ▀▀    ▀▀    ▀▀▀▀▀    ▀▀       ▀▀▀▀▀▀▀▀ ]],
            [[                      ███                                                       ]],
            [[                                                                                ]],

        }

        -- 2. BUTTONS
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
            dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        -- 3. FOOTER
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
        dashboard.section.footer.val = nvim_version_info

        -- 4. SETUP
        require("alpha").setup(dashboard.config)
    end,
}
