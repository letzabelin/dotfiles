local api = vim.api
local global = vim.g

-- Leader Key
map("n", "<space>", "<nop>")
global.mapleader = " "

-- Remove annoying exmode
map("n", "Q", "<Nop>", {noremap = true})
map("n", "q:", "<Nop>", {noremap = true})

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- apply dot to selected lines
map("v", ".", ":normal .<CR>")
map("x", "@", ":normal @<CR>")
map("n", "@", ":normal @<CR>")

-- Zero should go to the first non-blank character not to the first column (which could be blank)
map("n", "0", "^")

-- Map jk for ESC
map("i", "jk", "<ESC>", {noremap = true})

-- Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
map("n", "j", "gj")
map("n", "k", "gk")

-- Scroll page horizontally centres
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Do Y to yank till the end of the line
map("n", "Y", "y$")

-- Map ctrl-movement keys to window switching
map("", "<C-k>", "<C-w><Up>")
map("", "<C-j>", "<C-w><Down>")
map("", "<C-l>", "<C-w><Right>")
map("", "<C-h>", "<C-w><Left>")

-- Format the entire file
map("n", "ff", ":normal! gg=G``<CR>")
-- map("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })

-- Nohlsearch
map("n", "//", ":nohl<CR>", {silent = true})
map("n", "<leader>hl", ":set hlsearch! hlsearch?<CR>", {noremap = true})

-- Copy to system clipboard
map("v", "<leader>c", '"+y')

-- Indent
local indent_groups =
    api.nvim_exec(
    [[
        augroup indent
          autocmd FileType html imap <c-k><c-j> <CR><Esc>O
          autocmd FileType eruby imap <c-k><c-j> <CR><Esc>O
        augroup END
    ]],
    true
)

api.nvim_exec([[
    nmap <expr> f reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
    nmap <expr> F reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
    nmap <expr> t reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
    nmap <expr> T reg_recording() .. reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
]], true)

map("i", "<C-k><C-j>", "<CR><ESC>O<Tab>")

-- Set text wrapping toggles
map("n", "<leader>tw", ":set invwrap<CR>:set wrap?<CR>", {silent = true})

-- database
vim.g.dbs = {
  dev = 'postgres://postgres:1q1231q@192.168.20.101:5432/erp'
}

-- if press 'a' no empty line it should respect indent
map("n", "a", "len(getline('.')) == 0 ? 'S' : 'a'", { expr = true })

-- stay cursor on place when 'J'
map("n", "J", "mzJ`z")
