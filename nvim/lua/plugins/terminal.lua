return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]], -- Key to toggle the terminal (Ctrl + Backslash)
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true, -- Whether or not the open mapping applies in insert mode
                persist_size = true,
                direction = "float",    -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })

            -- BETTER NAVIGATION
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }

                -- Double Esc to enter Normal Mode (to scroll, copy, search)
                vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], opts)

                -- Navigate between windows easily, even from the terminal
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

                -- Easy way to maximize/restore current window inside terminal
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

            -- Apply these keymaps only when opening a terminal
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end
    }
}
