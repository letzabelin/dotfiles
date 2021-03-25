return function()
  local options = { silent = true }

  map('n', '<leader>t', [[:TestNearest<CR>]], options)
  map('n', 't<C-f>',    [[:TestFile<CR>]],    options)
  map('n', 't<C-s>',    [[:TestSuite<CR>]],   options)
  map('n', 't<C-l>',    [[:TestLast<CR>]],    options)
  map('n', 't<C-g>',    [[:TestVisit<CR>]],   options)

  -- For scrolling in test
  map('t', '<C-o>', '<C-\\><C-n>')

  -- Jest config
  vim.cmd [[let g:test#javascript#runner = "jest"]]
  vim.cmd [[let g:test#javascript#jest#executable = 'npx -n --experimental-vm-modules -n --no-warnings jest --colors']]
end
