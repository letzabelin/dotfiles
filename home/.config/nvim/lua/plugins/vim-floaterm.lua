return function()
    local options = {noremap = true, silent = true}

    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_title = "TERMINAL"
    map("n", "<c-e>", [[:FloatermToggle<CR>]], options)
    map("t", "<c-e>", [[<C-\><C-n>:FloatermToggle<CR>]], options)
    vim.cmd [[hi FloatermBorder guibg=none guifg=none ]]
end
