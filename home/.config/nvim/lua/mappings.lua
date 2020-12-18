-- Leader Key
vim.g.mapleader = " "
-- Map jk for ESC
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

-- Move between vim-tabs
vim.api.nvim_set_keymap('n', '<a-m>', [[:tabNext<CR>]], {})

-- Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
vim.api.nvim_set_keymap('n', 'j', 'gj', {})
vim.api.nvim_set_keymap('n', 'k', 'gk', {})

-- Scroll page horizontally centres
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', {})
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', {})

-- Do Y to yank till the end of the line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {})

-- Map ctrl-movement keys to window switching
vim.api.nvim_set_keymap('', '<C-k>', '<C-w><Up>', {})
vim.api.nvim_set_keymap('', '<C-j>', '<C-w><Down>', {})
vim.api.nvim_set_keymap('', '<C-l>', '<C-w><Right>', {})
vim.api.nvim_set_keymap('', '<C-h>', '<C-w><Left>', {})

-- Format the entire file
vim.api.nvim_set_keymap('n', 'ff', [[:normal! gg=G``<CR>]], {})

-- Nohlsearch
vim.api.nvim_set_keymap('n', '//', ':nohl<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>hl', ':set hlsearch! hlsearch?<CR>', { noremap = true })

-- Copy to system clipboard
vim.api.nvim_set_keymap('v', '<leader>c', '"+y', {})

-- Indent
local indent_groups = vim.api.nvim_exec([[
augroup indent
  autocmd FileType html imap <c-k><c-j> <CR><Esc>O
  autocmd FileType eruby imap <c-k><c-j> <CR><Esc>O
augroup END
]], true)

vim.api.nvim_set_keymap('i', '<C-k><C-j>', '<CR><ESC>O<Tab>', {})

-- Set text wrapping toggles
vim.api.nvim_set_keymap('n', '<leader>tw', ':set invwrap<CR>:set wrap?<CR>', { silent = true })
