return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,

            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(file_path)
                        -- auto close
                        require("neo-tree.command").execute({ action = "close" })
                    end
                },
            },

            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
        })

        -- Keymap to toggle the explorer
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer" })
    end,
}
