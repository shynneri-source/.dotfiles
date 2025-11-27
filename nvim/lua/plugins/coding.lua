return {
	-- 1. Auto-Pairs (Essential)
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- 2. Signature Help (Your Custom Config + Pro Features)
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup({
				-- 1. The Core Behavior
				bind = true,
				floating_window = true,
				floating_window_above_cur_line = true,

				-- 2. The Ghost Text Hint
				hint_enable = true,
				hint_prefix = "🡆 ",
	   hint_scheme = "String",

	   -- 3. The Window Look
	   handler_opts = {
		   border = "rounded",
	   },
	   zindex = 50,
	   padding = " ",
	   transparency = 20, -- Fixed typo from 'transpancy'

	   -- 4. Power User Features
	   doc_lines = 10,
	   max_height = 12,
	   max_width = 80,
	   wrap = true,

	   -- 5. Triggers & Toggles
	   extra_trigger_chars = { "(", ",", "{" },
	   toggle_key = "<C-k>",
	   select_signature_key = "<C-nn",
   })   end   },
}
