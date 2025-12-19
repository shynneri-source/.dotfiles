return {
	"hedyhli/outline.nvim",
	config = function()
		require("outline").setup({
			outline_window = {
				position = "right",
				width = 25,
			},
		})

		-- Keymap
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
	end,
}
