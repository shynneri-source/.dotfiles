local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set Leader Key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Fast saving/quitting
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Window Navigation (easier than Ctrl-w + hjkl)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlights
map("n", "<Esc>", ":nohl<CR>", opts)

-- === Customize keymaping ===
map({ "n", "v" }, "1", "0", opts)
map({ "n", "v" }, "0", "$", opts)
