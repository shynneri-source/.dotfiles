-- lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  -- `build` will run :TSUpdate command to install/update parsers
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- List of languages you want Treesitter to support.
      -- Treesitter will automatically download and compile "parser" for these languages.
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "lua", -- Important for Neovim configuration
        "python",
        "vim", -- Support for .vim files
        "vimdoc", -- Support for vim help files
        "query", -- Treesitter's own query language
      },

      -- Auto-install parser for new languages when you open files
      auto_install = true,

      -- Enable highlight module. This is the main feature!
      highlight = {
        enable = true,
      },

      -- Enable indent module for smarter indentation
      indent = {
        enable = true,
      },
    })
  end,
}
