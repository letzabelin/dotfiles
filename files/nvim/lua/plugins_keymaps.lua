-- Easy-motion key
vim.api.nvim_set_keymap('n', '<leader>', '<Plug>(easymotion-prefix)', {})

-- Word-motion prefix
vim.g.wordmotion_prefix = ','

-- Intent guides
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_enable_on_vim_startup = 1

-- Abbreviations
vim.api.nvim_exec(
  [[
    function! InitAbbreviations()
      Abolish! -cmdline co{snt,tsn,tns,nts} co{nst}
      Abolish! -cmdline ret{utn,nurn} ret{urn}
      Abolish! -cmdline aw{ati,tai,tia} aw{ait}
      Abolish! -cmdline len{ght} len{gth}
      Abolish! -cmdline tr{eu} tr{ue}
      Abolish! -cmdline fun{citon} fun{ction}
    endfunction
    autocmd VimEnter * call InitAbbreviations()
  ]],
  true
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

-- FZF
-- vim.api.nvim_set_keymap('n', '<leader>b', [[:Buffers<CR>]], { noremap = true })
-- nnoremap <Leader>o :GFiles .<CR>
-- nnoremap <leader>fc :Commits<CR>
-- nnoremap <leader>aa :Ag<CR>
-- nnoremap <leader>ff :Files<CR>
-- nnoremap <leader>gs :Gstatus<CR>

-- " Mapping selecting mappings
-- nmap <leader><tab> <plug>(fzf-maps-n)
-- xmap <leader><tab> <plug>(fzf-maps-x)
-- omap <leader><tab> <plug>(fzf-maps-o)

-- " Insert mode completion
-- imap <c-x><c-k> <plug>(fzf-complete-word)
-- imap <c-x><c-f> <plug>(fzf-complete-path)
-- imap <c-x><c-j> <plug>(fzf-complete-file-ag)
-- imap <c-x><c-l> <plug>(fzf-complete-line)

-- command! -bang -nargs=? -complete=dir GFiles
--       \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

-- command! -bang -nargs=? -complete=dir Files
--       \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
