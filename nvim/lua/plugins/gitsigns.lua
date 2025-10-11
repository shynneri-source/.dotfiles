-- lua/plugins/gitsigns.lua

return {
	"lewis6991/gitsigns.nvim",
	-- Load plugin when opening code file
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			-- Configure display symbols
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},

			-- Other customizations
			current_line_blame = false, -- Disable inline blame to reduce clutter
			signcolumn = true,
		})

		-- =======================================================
		-- CUSTOM KEYMAPS FOR GITSIGNS
		-- =======================================================
		local gs = package.loaded.gitsigns

		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Go to next hunk" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Go to previous hunk" })

		-- Actions
		vim.keymap.set({ "n", "v" }, "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
		vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
		vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { desc = "Stage entire buffer" })
		vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { desc = "Reset entire buffer" })
		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
		vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
	end,
}
