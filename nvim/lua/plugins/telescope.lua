-- lua/plugins/telescope.lua

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Extension to speed up sorting, highly recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- Don't close Telescope window when in Insert mode
				-- allows you to edit search content
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move up
						["<C-j>"] = actions.move_selection_next, -- move down
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		-- Load fzf-native extension to speed up
		telescope.load_extension("fzf")

		-- =======================================================
		-- KEYMAPS - This is the most important part
		-- =======================================================
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text (grep)" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find in help" })
	end,
}
