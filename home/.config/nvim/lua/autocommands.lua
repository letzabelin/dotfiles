-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = {'*'},
    callback = function()
        vim.highlight.on_yank({higroup = 'Visual', timeout = 300})
    end
})

-- vim.api.nvim_create_autocmd({'FocusLost'}, {command = 'silent! wa'})

-- vim.api.nvim_create_autocmd("FocusLost", {
--     pattern = "*",
--     command = [[call feedkeys("\<esc>")]]
-- })

-- save all files when focus lost
-- vim.api.nvim_create_autocmd('FocusLost', {
--     pattern = {'*'},
--     command = 'wa!'
--     -- group = vim.api.nvim_create_augroup('FocusLostStuff', {clear = true}),
--     -- callback = function()
--     --     -- vim.cmd.stopinsert()
--     --     -- vim.cmd.wall {mods = {silent = true}}
--     --     -- -- Auto save files when focus is lost
--     -- end
-- })
