return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      ensure_installed = { 
        "c", "cpp", "rust", "go", "python", "javascript", "typescript", 
        "markdown", "markdown_inline", "lua", "vim", "vimdoc" 
      },
      sync_install = false,
      auto_install = true, -- Automatically install missing parsers when entering buffer
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true }, 
    })
  end,
}
