return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true, -- Shows "Who wrote this code?" ghost text
			current_line_blame_opts = {
				delay = 500, -- Delay before showing the blame
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Keymaps for Git
				map("n", "]c", gs.next_hunk, "Next Git Change")
				map("n", "[c", gs.prev_hunk, "Previous Git Change")
				map("n", "<leader>gp", gs.preview_hunk, "Preview Git Change")
				map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle Git Blame")
			end,
		})
	end,
}
