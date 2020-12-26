local map = require('utils').map
local api = vim.api
local global = vim.g

-- Leader Key
global.mapleader = " "
-- Map jk for ESC
map('i', 'jk', '<ESC>', { noremap = true })

-- Move between vim-tabs
map('n', '<a-m>', ':tabNext<CR>')

-- Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Scroll page horizontally centres
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- Do Y to yank till the end of the line
map('n', 'Y', 'y$')

-- Map ctrl-movement keys to window switching
map('', '<C-k>', '<C-w><Up>')
map('', '<C-j>', '<C-w><Down>')
map('', '<C-l>', '<C-w><Right>')
map('', '<C-h>', '<C-w><Left>')

-- Format the entire file
map('n', 'ff', ':normal! gg=G``<CR>')

-- Nohlsearch
map('n', '//', ':nohl<CR>', { silent = true })
map('n', '<leader>hl', ':set hlsearch! hlsearch?<CR>', { noremap = true })

-- Copy to system clipboard
map('v', '<leader>c', '"+y')

-- Indent
local indent_groups = api.nvim_exec([[
augroup indent
  autocmd FileType html imap <c-k><c-j> <CR><Esc>O
  autocmd FileType eruby imap <c-k><c-j> <CR><Esc>O
augroup END
]], true)

map('i', '<C-k><C-j>', '<CR><ESC>O<Tab>')

-- Set text wrapping toggles
map('n', '<leader>tw', ':set invwrap<CR>:set wrap?<CR>', { silent = true })

-- Ultisnips
global.UltiSnipsSnippetDirectories = { '~/.config/nvim/ultisnips', 'ultisnips' }
global.UltiSnipsExpandTrigger = "<tab>"
global.UltiSnipsJumpForwardTrigger = "<tab>"
global.UltiSnipsJumpBackwardTrigger = "<s-tab>"
global.UltiSnipsEditSplit = "vertical"
