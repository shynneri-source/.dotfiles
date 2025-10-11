-- nvim/init.lua

-- ===================================================================
-- STEP 1: Load core configurations (Options, Keymaps) FIRST
-- ===================================================================
-- This way, Neovim will know what `mapleader` is before loading any plugins.
require("config.options")
require("config.keymaps")

-- ===================================================================
-- STEP 2: Setup lazy.nvim Plugin Manager
-- ===================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ===================================================================
-- STEP 3: Load all plugins from 'lua/plugins' directory via lazy.nvim
-- ===================================================================
-- lazy.nvim config will automatically find and load all .lua files in `lua/plugins/`
require("lazy").setup("plugins", {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
