return {
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({
                style = "auto",

                width = 120,
                height = 100,
                width_ratio = 0.7, -- 70% of screen width
                height_ratio = 0.7,

                border = "rounded", -- 'single', 'double', 'shadow', 'rounded'
            })

            vim.keymap.set("n", "<leader>p", "<cmd>Glow<CR>", { desc = "Preview Markdown (GitHub Style)" })
        end,
    }
}
