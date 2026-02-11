return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" }, -- Lazy load to prevent startup issues
        config = function()
            local status_ok, configs = pcall(require, "nvim-treesitter.configs")
            if not status_ok then
                return -- If not found, do nothing (prevents the crash)
            end

            configs.setup({
                ensure_installed = {
                    "bash", "c", "cpp", "go", "lua", "markdown",
                    "markdown_inline", "python", "query", "rust", "vim", "vimdoc"
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
