local map = vim.keymap.set

-- =============================================================================
--  STANDARD KEYMAPS
-- =============================================================================

-- Clear search highlights with <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better window navigation (Control + h/j/k/l)
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- =============================================================================
--  CUSTOM REQUESTS
-- =============================================================================


-- H -> Go to start of line (First non-blank character)
-- Works in Normal, Visual, and Operator-pending (e.g., dH, cH, yH)
map({ "n", "v", "o" }, "H", "^", { desc = "Go to start of line" })
-- L -> Go to end of line
-- Works in Normal, Visual, and Operator-pending (e.g., dL, cL, yL)
map({ "n", "v", "o" }, "L", "$", { desc = "Go to end of line" })

-- 2. Toggle Word Wrap (Fast toggle)
map("n", "<leader>w", function()
    vim.opt.wrap = not vim.opt.wrap:get()
    print("Wrap: " .. tostring(vim.opt.wrap:get()))
end, { desc = "Toggle line wrapping" })

-- 3. Indent/Outdent with Tab/Shift+Tab (Visual Mode)
-- The '<gv' part re-selects the text so you can hit Tab multiple times
map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })

-- 4. Allow wrapping cursor at start/end of line
-- This allows <Left> at char 1 to wrap to the previous line
vim.opt.whichwrap:append("<,>,[,],h,l")

-- =============================================================================
--  LSP / DIAGNOSTICS
-- =============================================================================

-- Navigate errors (Next/Prev)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Popup: Show error in a floating window (Hover)
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error (Popup)" })

-- Buffer: Open all errors in a list (Quickfix) so you can copy/see all
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list (Buffer)" })

-- =============================================================================
--  OIL.NVIM UTILS
-- =============================================================================

-- Toggle Hidden Files in Oil
-- Note: Usually '.' inside Oil does this, but here is a forced toggle
map("n", "<leader>h.", function()
    if vim.bo.filetype == "oil" then
        require("oil").toggle_hidden()
    else
        print("Not an Oil buffer")
    end
end, { desc = "Toggle hidden files in Oil" })
