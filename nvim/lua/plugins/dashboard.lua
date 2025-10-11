-- lua/plugins/dashboard.lua

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")

		-- =======================================================
		-- SECTION 1: HEADER "SHYNNERI"
		-- =======================================================
		local function escape_ascii(lines)
			local escaped_lines = {}
			for _, line in ipairs(lines) do
				table.insert(escaped_lines, (string.gsub(line, "\\", "\\\\")))
			end
			return escaped_lines
		end

		local ascii_art = {
			[[                                                                                ]],
			[[           ▄▄                                                             ██    ]],
			[[           ██                                                             ▀▀    ]],
			[[ ▄▄█████▄  ██▄████▄  ▀██  ███  ██▄████▄  ██▄████▄   ▄████▄    ██▄████   ████    ]],
			[[ ██▄▄▄▄ ▀  ██▀   ██   ██▄ ██   ██▀   ██  ██▀   ██  ██▄▄▄▄██   ██▀         ██    ]],
			[[  ▀▀▀▀██▄  ██    ██    ████▀   ██    ██  ██    ██  ██▀▀▀▀▀▀   ██          ██    ]],
			[[ █▄▄▄▄▄██  ██    ██     ███    ██    ██  ██    ██  ▀██▄▄▄▄█   ██       ▄▄▄██▄▄▄ ]],
			[[  ▀▀▀▀▀▀   ▀▀    ▀▀     ██     ▀▀    ▀▀  ▀▀    ▀▀    ▀▀▀▀▀    ▀▀       ▀▀▀▀▀▀▀▀ ]],
			[[                      ███                                                       ]],
			[[                                                                                ]],
		}

		local header = {
			type = "text",
			val = escape_ascii(ascii_art),
			opts = { hl = "String", position = "center" },
		}

		-- =======================================================
		-- SECTION 2: CUSTOMIZE MENU
		-- =======================================================
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("n", "  " .. string.format("%-20s", "New file"), "<cmd>enew<CR>"),
			dashboard.button("f", "  " .. string.format("%-20s", "Find file"), "<cmd>Telescope find_files<CR>"),
			dashboard.button("g", "  " .. string.format("%-20s", "Find text"), "<cmd>Telescope live_grep<CR>"),
			dashboard.button("r", "  " .. string.format("%-20s", "Recent files"), "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("l", "  " .. string.format("%-20s", "Lazy"), "<cmd>Lazy<CR>"),
			dashboard.button("q", "  " .. string.format("%-20s", "Quit"), "<cmd>qa<CR>"),
		}

		-- =======================================================
		-- SECTION 3: LAYOUT ARRANGEMENT
		-- =======================================================
		dashboard.section.header = header
		dashboard.section.footer.val = "Made by shynn with <3 and Lua"

		-- Arrange layout as desired
		dashboard.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
			dashboard.section.footer,
		}

		alpha.setup(dashboard)

		-- =======================================================
		-- SECTION 4: HIDE UNNECESSARY UI
		-- =======================================================
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				vim.cmd("set showtabline=0 | set laststatus=0 | set noruler")
			end,
		})
		vim.api.nvim_create_autocmd("BufUnload", {
			pattern = "alpha",
			callback = function()
				vim.cmd("set showtabline=2 | set laststatus=3 | set ruler")
			end,
		})
	end,
}
