local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8 -- keep space above and below cursor

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Behavior
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.mouse = "a" -- allow mouse (optional but useful)
opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4       
opt.shiftwidth = 4   
opt.softtabstop = 4   
opt.expandtab = true  

opt.autoindent = true
vim.cmd("filetype plugin indent on")
