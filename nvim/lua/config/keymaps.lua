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

-- Custom mappings move to start and move to the end
map({ "n", "v" }, "1", "0", opts)
map({ "n", "v" }, "0", "$", opts)

--  Insert Mode Navigation
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Open terminal
vim.keymap.set('n', 'ter', function()
  vim.cmd('setlocal bufhidden=hide')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { noremap = true, silent = true })

-- ESC to escape terminal mode 
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
