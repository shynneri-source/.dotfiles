return {
    {
        "samharju/synthweave.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("synthweave")
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        opts = {},
    },
}
