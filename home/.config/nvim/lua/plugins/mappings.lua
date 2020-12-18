-- Easy-motion key
vim.api.nvim_set_keymap('n', '<leader>', '<Plug>(easymotion-prefix)', {})

-- Word-motion prefix
vim.g.wordmotion_prefix = ','

-- Databases
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.dbs = {
  dev = 'postgres://andrew:1234@localhost:5432/learning_ruby_development'
}

-- Matchup
vim.g.matchup_matchparen_offscreen = {}

-- Status line
vim.cmd [[
  function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
      return '[' . luaeval("require('lsp-status').status()") . ']'
    endif

    return ''
  endfunction
]]

vim.g.lightline = {
  colorscheme = 'wombat',
  active = {
    left = {{'mode', 'paste'}, {'filename', 'modified'}},
    right = {{'lineinfo'}, {'percent'}, {'gitbranch'}, {'readonly'}, {'LspStatus'}}
  },
  component_function = {
    gitbranch = 'FugitiveHead',
    LspStatus = 'LspStatus'
  }
}

-- JS settings for emmet
vim.g.user_emmet_settings = {
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
]],true
)

-- Switch key toggles
vim.g.switch_mapping = "-"

-- Testing with vim-test
vim.api.nvim_set_keymap('n', '<leader>t', [[:TestNearest<CR>]], { silent = true })
vim.api.nvim_set_keymap('n', 't<C-f>', [[:TestFile<CR>]], { silent = true })
vim.api.nvim_set_keymap('n', 't<C-s>', [[:TestSuite<CR>]], { silent = true })
vim.api.nvim_set_keymap('n', 't<C-l>', [[:TestLast<CR>]], { silent = true })
vim.api.nvim_set_keymap('n', 't<C-g>', [[:TestVisit<CR>]], { silent = true })

-- For scrolling in test
vim.api.nvim_set_keymap('t', '<C-o>', '<C-\\><C-n>', {})

-- Jest config
vim.cmd [[let g:test#javascript#runner = "jest"]]
vim.cmd [[let g:test#javascript#jest#executable = 'npx -n --experimental-vm-modules -n --no-warnings jest --colors']]

-- Search in files with ctrlsf
vim.api.nvim_set_keymap('n', '<C-f>f', '<Plug>CtrlSFPrompt', {})
vim.api.nvim_set_keymap('v', '<C-f>f', '<Plug>CtrlSFVwordPath', {})
vim.api.nvim_set_keymap('v', '<C-f>F', '<Plug>CtrlSFVwordExec', {})
vim.api.nvim_set_keymap('n', '<C-f>n', '<Plug>CtrlSFCwordPath', {})
vim.api.nvim_set_keymap('n', '<C-f>p', '<Plug>CtrlSFPwordPath', {})
vim.api.nvim_set_keymap('n', '<C-f>o', ':CtrlSFOpen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>t', ':CtrlSFToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>t', ':CtrlSFToggle<CR>', { noremap = true })

-- FTerm
require('FTerm').setup({
  dimensions = { height = 0.8, width = 0.8, row = 0.5, col = 0.5 }
})
vim.api.nvim_set_keymap('n', '<A-i>', ':FTermToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-i>', '<C-\\><C-n>:FTermToggle<CR>', { noremap = true, silent = true })

-- Rainbow Brackets
vim.g.rainbow_active = 1

-- AnyJump code definition
vim.api.nvim_set_keymap('n', 'go', ':AnyJump<CR>', {})

-- FZF
vim.api.nvim_set_keymap('n', '<leader>b', [[:Buffers<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>o', [[:GFiles .<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[:Commits<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', [[:Ag<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[:Files<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', [[:Gstatus<CR>]], { noremap = true })

-- Selecting mappings
vim.api.nvim_set_keymap('n', '<leader><tab>', '<plug>(fzf-maps-n)', {})
vim.api.nvim_set_keymap('x', '<leader><tab>', '<plug>(fzf-maps-x)', {})
vim.api.nvim_set_keymap('o', '<leader><tab>', '<plug>(fzf-maps-o)', {})

-- command! -bang -nargs=? -complete=dir GFiles
--       \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

-- command! -bang -nargs=? -complete=dir Files
--       \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
