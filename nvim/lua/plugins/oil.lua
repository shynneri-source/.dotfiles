return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        -- Helper to display path in the window bar
        function _G.get_oil_winbar()
            local dir = require("oil").get_current_dir()
            if dir then
                return vim.fn.fnamemodify(dir, ":p")
            else
                return vim.api.nvim_buf_get_name(0)
            end
        end

        -- Toggle Keymap (Global)
        vim.keymap.set("n", "<C-p>", function()
            if vim.bo.filetype == "oil" then
                require("oil").close()
            else
                require("oil").open()
            end
        end, { desc = "Toggle Oil" })

        require("oil").setup({
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,

            -- COLUMNS CONFIGURATION
            columns = {
                "permissions",
                "size",
                {
                    "mtime",
                    format = "%d/%m/%y-%H:%M:%S",
                },
                "icon",
            },

            -- Winbar to show the path at the top
            win_options = {
                winbar = "%!v:lua.get_oil_winbar()",
            },

            layout = {
                padding = 2,
                max_width = 90,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },

            view_options = {
                show_hidden = true,
                -- Sort: Directories (type) first, then Name
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
                is_always_hidden = function(name, _)
                    local hidden_names = { "__pycache__" }
                    local hidden_patterns = { "%.pyc$" }
                    for _, hidden in ipairs(hidden_names) do
                        if name == hidden then return true end
                    end
                    for _, pattern in ipairs(hidden_patterns) do
                        if name:match(pattern) then return true end
                    end
                    return false
                end,
            },

            keymaps = {
                ["q"] = "actions.close",
                ["<C-p>"] = "actions.close",
                ["<CR>"] = "actions.select",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g?"] = "actions.show_help",

                ["/"] = {
                    callback = function()
                        local dir = require("oil").get_current_dir()
                        require("telescope.builtin").find_files({
                            cwd = dir,
                            hidden = true
                        })
                    end,
                    desc = "Fuzzy search files in current directory",
                },
            },
        })
    end,
}
