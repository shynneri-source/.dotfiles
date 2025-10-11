-- lua/plugins/toggleterm.lua

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- =======================================================
		-- KEYMAPS AND UTILITY FUNCTIONS
		-- =======================================================
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		local function close_all_terminals()
			local terms = require("toggleterm.terminal").get_all()
			if #terms > 0 then
				for _, term in ipairs(terms) do
					term:close()
				end
				vim.notify("Closed all terminals.", vim.log.levels.INFO)
			else
				vim.notify("No terminals are open.", vim.log.levels.INFO)
			end
		end

		vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Float)" })
		vim.keymap.set(
			"n",
			"<leader>th",
			"<cmd>ToggleTerm direction=horizontal<cr>",
			{ desc = "Toggle Terminal (Horizontal)" }
		)
		vim.keymap.set(
			"n",
			"<leader>tv",
			"<cmd>ToggleTerm direction=vertical<cr>",
			{ desc = "Toggle Terminal (Vertical)" }
		)
		vim.keymap.set("n", "<leader>td", close_all_terminals, { desc = "Close all Terminals" })

		-- =======================================================
		-- AUTO CLOSE TERMINAL WHEN EXITING NEOVIM
		-- =======================================================
		vim.api.nvim_create_autocmd("VimLeavePre", {
			group = vim.api.nvim_create_augroup("MyToggleTermClose", { clear = true }),
			callback = function()
				-- Check if any terminals are open
				if #require("toggleterm.terminal").get_all() > 0 then
					-- Send command to close all
					require("toggleterm").close_all()
				end
			end,
		})
	end,
}
