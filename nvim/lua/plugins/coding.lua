return {
	-- 1. Auto-Pairs: Automatically add ) when you type (
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- It handles (), [], {}, '', "" automatically
	},

	-- 2. Signature Help: The "Box" that appears inside ()
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup({
				bind = true,
				floating_window = true,
				hint_enable = false,
				handler_opts = {
					border = "rounded",
				},
				toggle_key = "<C-k>",
			})
		end,
	},
}
