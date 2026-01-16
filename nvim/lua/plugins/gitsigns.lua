return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map("n", "]h", function()
                        if vim.wo.diff then return "]c" end
                        vim.schedule(function() gs.next_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Next Git Hunk" })

                    map("n", "[h", function()
                        if vim.wo.diff then return "[c" end
                        vim.schedule(function() gs.prev_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Prev Git Hunk" })

                    -- Actions
                    map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
                    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
                    map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
                    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
                    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
                    map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame Line" })
                    map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
                end,
            })
        end,
    }
}
