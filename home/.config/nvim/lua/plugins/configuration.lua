local map = require('utils').map
local api = vim.api
local global = vim.g
local noremapOpts = { noremap = true }
local silentOpts = { silent = true }
local unionOpts = vim.tbl_extend('keep', noremapOpts, silentOpts)

-- Easy-motion key
map('n', '<leader>', [[<Plug>(easymotion-prefix)]])

-- Word-motion prefix
global.wordmotion_prefix = ','

-- Databases
global.db_ui_auto_execute_table_helpers = 1
global.dbs = {
  dev = 'postgres://andrew:1234@localhost:5432/learning_ruby_development'
}

-- Matchup
global.matchup_matchparen_offscreen = { method = 'popup' }

-- JS settings for emmet
global.user_emmet_settings = {
  javascript = {
    extends = 'jsx',
  },
}

-- Abbreviations
vim.api.nvim_exec([[
  function! InitAbbreviations()
    Abolish! -cmdline co{snt,tsn,tns,nts} co{nst}
    Abolish! -cmdline ret{utn,nurn} ret{urn}
    Abolish! -cmdline aw{ati,tai,tia} aw{ait}
    Abolish! -cmdline len{ght} len{gth}
    Abolish! -cmdline tr{eu} tr{ue}
    Abolish! -cmdline fun{citon} fun{ction}
  endfunction
  autocmd VimEnter * call InitAbbreviations()
]], true)

-- Switch key toggles
global.switch_mapping = "-"

-- Testing with vim-test
map('n', '<leader>t', [[:TestNearest<CR>]], silentOpts)
map('n', 't<C-f>',    [[:TestFile<CR>]],    silentOpts)
map('n', 't<C-s>',    [[:TestSuite<CR>]],   silentOpts)
map('n', 't<C-l>',    [[:TestLast<CR>]],    silentOpts)
map('n', 't<C-g>',    [[:TestVisit<CR>]],   silentOpts)

-- For scrolling in test
map('t', '<C-o>', '<C-\\><C-n>')

-- Jest config
vim.cmd [[let g:test#javascript#runner = "jest"]]
vim.cmd [[let g:test#javascript#jest#executable = 'npx -n --experimental-vm-modules -n --no-warnings jest --colors']]

-- Search in files with ctrlsf
map('n', '<C-f>f', [[<Plug>CtrlSFPrompt]])
map('v', '<C-f>f', [[<Plug>CtrlSFVwordPath]])
map('v', '<C-f>F', [[<Plug>CtrlSFVwordExec]])
map('n', '<C-f>n', [[<Plug>CtrlSFCwordPath]])
map('n', '<C-f>p', [[<Plug>CtrlSFPwordPath]])
map('n', '<C-f>o', [[:CtrlSFOpen<CR>]],   noremapOpts)
map('n', '<C-f>t', [[:CtrlSFToggle<CR>]], noremapOpts)
map('i', '<C-f>t', [[:CtrlSFToggle<CR>]], noremapOpts)

-- FTerm
require('FTerm').setup({
  dimensions = { height = 0.8, width = 0.8, row = 0.5, col = 0.5 }
})
map('n', '<A-i>', [[:FTermToggle<CR>]],           unionOpts)
map('t', '<A-i>', [[<C-\><C-n>:FTermToggle<CR>]], unionOpts)

-- Rainbow Brackets
global.rainbow_active = 1
global.rainbow_conf = {
  separately = {
    html = 0,
    css = 0,
  }
}

-- AnyJump code definition
map('n', 'go', [[:AnyJump<CR>]], {})

-- Snippets
global.vsnip_snippet_dir = '~/.config/nvim/snippets'
global.vsnip_namespace   = ''

map('i', '<tab>',   [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>']], { expr = true })
map('s', '<tab>',   [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>']], { expr = true })
map('i', '<s-tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>']],    { expr = true })
map('s', '<s-tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>']],    { expr = true })

vim.api.nvim_exec([[
  let g:vsnip_filetypes = {}
  let g:vsnip_filetypes.typescript = ['javascript']
  let g:vsnip_filetypes.javascriptreact = ['javascript', 'javascriptreact']
  let g:vsnip_filetypes.typescriptreact = ['javascriptreact', 'typescript']
]], true)

-- FZF
map('n', '<leader>b',  [[:Buffers<CR>]],  noremapOpts)
map('n', '<leader>o',  [[:GFiles .<CR>]], noremapOpts)
map('n', '<leader>fc', [[:Commits<CR>]],  noremapOpts)
map('n', '<leader>aa', [[:Ag<CR>]],       noremapOpts)
map('n', '<leader>ff', [[:Files<CR>]],    noremapOpts)
map('n', '<leader>gs', [[:Gstatus<CR>]],  noremapOpts)

-- Selecting mappings
map('n', '<leader><tab>', [[<plug>(fzf-maps-n)]])
map('x', '<leader><tab>', [[<plug>(fzf-maps-x)]])
map('o', '<leader><tab>', [[<plug>(fzf-maps-o)]])

-- Preview
vim.cmd[[command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)]]
vim.cmd[[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)]]

-- Lsp
vim.g.lsp_settings_servers_dir = vim.fn.stdpath("cache") .. "/lspconfig"
