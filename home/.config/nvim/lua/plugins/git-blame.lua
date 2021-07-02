return function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_message_template = "<author> • <sha> • <date> • <summary>"

    map("n", "<leader>gm", "<cmd>GitBlameToggle<cr>")
end
