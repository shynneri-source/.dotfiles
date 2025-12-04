
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Clear highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Custom mappings
map({ "n", "v" }, "1", "0", opts)
map({ "n", "v" }, "0", "$", opts)
