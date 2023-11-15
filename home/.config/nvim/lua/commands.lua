-- Leader Key
vim.api.nvim_set_keymap("n", "<space>", "<nop>",
                        {noremap = true, silent = true, expr = false})
vim.g.mapleader = " "

vim.g.switch_mapping = '-'

-- Remove annoying exmode
vim.api.nvim_set_keymap("n", "Q", "<Nop>", {noremap = true})
vim.api.nvim_set_keymap("n", "q:", "<Nop>", {noremap = true})

-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", ">", ">gv",
                        {noremap = true, silent = true, expr = false})

-- Move to the end of yanked text after yank and paste
vim.api.nvim_set_keymap("n", "p", "p`]",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "y", "y`]",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "p", "p`]",
                        {noremap = true, silent = true, expr = false})

-- apply dot to selected lines
vim.api.nvim_set_keymap("v", ".", ":normal .<CR>",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("x", "@", ":normal @<CR>",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "@", ":normal @<CR>",
                        {noremap = true, silent = true, expr = false})

-- Zero should go to the first non-blank character not to the first column (which could be blank)
vim.api.nvim_set_keymap("n", "0", "^",
                        {noremap = true, silent = true, expr = false})

-- Map jk for ESC
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true})

-- Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
vim.api.nvim_set_keymap("n", "j", "gj",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "k", "gk",
                        {noremap = true, silent = true, expr = false})

-- Scroll page horizontally centres
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz",
                        {noremap = true, silent = true, expr = false})

-- Do Y to yank till the end of the line
vim.api.nvim_set_keymap("n", "Y", "y$",
                        {noremap = true, silent = true, expr = false})

-- Map ctrl-movement keys to window switching
vim.api.nvim_set_keymap("", "<C-k>", "<C-w><Up>",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("", "<C-j>", "<C-w><Down>",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("", "<C-l>", "<C-w><Right>",
                        {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("", "<C-h>", "<C-w><Left>",
                        {noremap = true, silent = true, expr = false})

-- Format the entire file
vim.api.nvim_set_keymap("n", "ff", ":normal! gg=G``<CR>",
                        {noremap = true, silent = true, expr = false})

-- Nohlsearch
vim.api.nvim_set_keymap("n", "//", ":nohl<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>hl", ":set hlsearch! hlsearch?<CR>",
                        {noremap = true})

-- Copy to system clipboard
vim.api.nvim_set_keymap("v", "<leader>c", '"+y',
                        {noremap = true, silent = true, expr = false})

-- Indent
local indent_groups = vim.api.nvim_exec([[
        augroup indent
          autocmd FileType html imap <c-k><c-j> <CR><Esc>O
          autocmd FileType eruby imap <c-k><c-j> <CR><Esc>O
        augroup END
    ]], true)

vim.api.nvim_exec([[
    nmap <expr> f reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
    nmap <expr> F reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
    nmap <expr> t reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
    nmap <expr> T reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
]], true)

vim.api.nvim_set_keymap("i", "<C-k><C-j>", "<CR><ESC>O<Tab>",
                        {noremap = true, silent = true, expr = false})

-- Set text wrapping toggles
vim.api.nvim_set_keymap("n", "<leader>tw", ":set invwrap<CR>:set wrap?<CR>",
                        {silent = true})

-- if press 'a' no empty line it should respect indent
vim.api.nvim_set_keymap("n", "a", "len(getline('.')) == 0 ? 'S' : 'a'",
                        {expr = true})

-- stay cursor on place when 'J'
vim.api.nvim_set_keymap("n", "J", "mzJ`z",
                        {noremap = true, silent = true, expr = false})
