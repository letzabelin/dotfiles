return function()
    local options = {noremap = true}

    map("n", "<C-f>f", [[<Plug>CtrlSFPrompt]])
    map("v", "<C-f>f", [[<Plug>CtrlSFVwordPath]])
    map("v", "<C-f>F", [[<Plug>CtrlSFVwordExec]])
    map("n", "<C-f>n", [[<Plug>CtrlSFCwordPath]])
    map("n", "<C-f>p", [[<Plug>CtrlSFPwordPath]])
    map("n", "<C-f>o", [[:CtrlSFOpen<CR>]], options)
    map("n", "<C-f>t", [[:CtrlSFToggle<CR>]], options)
    map("i", "<C-f>t", [[:CtrlSFToggle<CR>]], options)
end
