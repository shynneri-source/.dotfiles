local opt = vim.opt

-- =============================================================================
--  CORE CODING SETTINGS
-- =============================================================================
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers (good for standard Vim movements)

-- Indentation
opt.tabstop = 4        -- Number of spaces tabs count for
opt.shiftwidth = 4     -- Size of an indent
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.wrap = false       -- Disable line wrap by default (you have <leader>w to toggle)

-- Safety (Persistent Undo)
-- This saves your undo history to a file, so you can undo even after closing Neovim.
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
opt.swapfile = false -- Disable swap files (prevents "Swap file exists" errors)

-- =============================================================================
--  UI & VISUALS
-- =============================================================================
opt.termguicolors = true      -- True color support
opt.cursorline = true         -- Highlight the current line
opt.scrolloff = 8             -- Keep 8 lines above/below cursor when scrolling
opt.sidescrolloff = 8         -- Keep 8 columns to the left/right when scrolling sideways
opt.signcolumn = "yes"        -- Always show the sign column (prevents text shift)
opt.fillchars = { eob = " " } -- Hide the "~" characters at the end of the buffer

-- Search Behavior
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true  -- Don't ignore case if search includes capitals
opt.incsearch = true  -- Show search matches as you type
opt.hlsearch = true   -- Highlight search results

-- =============================================================================
--  SYSTEM & COMPLETION
-- =============================================================================
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.updatetime = 250          -- Decrease update time (faster completion/git updates)
opt.timeoutlen = 300          -- Faster key sequence completion (good for which-key)

opt.splitright = true         -- Vertical splits happen to the right
opt.splitbelow = true         -- Horizontal splits happen below

-- Completion Menu
opt.completeopt = "menu,menuone,noselect" -- Standard setup for nvim-cmp
opt.shortmess:append("c")                 -- Hide "match x of y" messages in completion

-- Allow the cursor to move where there is no text in Block Selection Mode
opt.virtualedit = "block"
