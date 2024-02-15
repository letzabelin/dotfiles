-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = {'*'},
    callback = function()
        vim.highlight.on_yank({higroup = 'IncSearch', timeout = 300})
    end
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*.cljd'},
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_option(buf, 'filetype', 'clojure')
    end
})

-- vim.api.nvim_create_autocmd({'BufWinEnter', 'BufRead', 'BufNewFile'}, {
--     pattern = {'*.clj*'},
--     callback = function()
--         vim.opt.iskeyword:append("-")
--         vim.opt.iskeyword:append(".")
--         vim.opt.iskeyword:append("/")
--     end
-- })

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
