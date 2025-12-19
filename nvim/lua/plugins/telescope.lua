return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons", -- Optional: Adds icons to the UI
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- Move to prev item
                        ["<C-j>"] = actions.move_selection_next,     -- Move to next item
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            -- Pickers allow you to configure behavior for specific builtins
            pickers = {
                find_files = {
                    -- Professional workflow: show hidden files (like .env) but hide .git
                    hidden = true,
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        pcall(telescope.load_extension, "fzf")

        -- Set Keybinds
        local builtin = require("telescope.builtin")

        -- Standard Navigation
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind via [G]rep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
        
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent files" })
        vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
        
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    end,
}
