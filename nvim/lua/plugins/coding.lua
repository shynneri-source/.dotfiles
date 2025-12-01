return {
    -- 1. Auto-Pairs (Essential)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- 2. Signature Help
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup({
                -- 1. The Core Behavior
                bind = true,

                doc_lines = 10,

                -- 2. The Window Look
                floating_window = true,
                floating_window_above_cur_line = true,
                fix_pos = false,
                -- 3. The Ghost Text Hint
                hint_enable = true,
                hint_prefix = "➜ ",
                hint_scheme = "String",

                -- 4. Styling
                handler_opts = {
                    border = "rounded",
                },
                zindex = 50,
                padding = " ",
                transparency = 20,

                -- 5. Triggers & Toggles
                always_trigger = false,
                extra_trigger_chars = { "(", "," },

                toggle_key = "<C-k>",
                select_signature_key = "<C-n>",
            })
        end
    },
}
