-- lua/plugins/noice.lua

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins
				-- that use markdown just work
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can add other presets here
			presets = {
				bottom_search = true, -- Display search at the bottom
				command_palette = true, -- Enable command palette (replaces cmdline bar)
				long_message_to_split = true, -- Automatically open split for long messages
				inc_rename = false,
				lsp_doc_border = true, -- Add border to LSP documentation window
			},
		})
	end,
}
