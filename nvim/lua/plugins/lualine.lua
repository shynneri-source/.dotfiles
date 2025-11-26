return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", -- Automatically matches your Synthweave theme
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
