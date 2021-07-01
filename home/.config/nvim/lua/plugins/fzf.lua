return function()
  local options = { noremap = true }

  map("n", "<leader>b",  [[:Buffers<CR>]],  options)
  map("n", "<leader>o",  [[:GFiles .<CR>]], options)
  map("n", "<leader>fc", [[:Commits<CR>]],  options)
  map("n", "<leader>aa", [[:Ag<CR>]],       options)
  map("n", "<leader>ff", [[:Files<CR>]],    options)
  map("n", "<leader>gs", [[:Gstatus<CR>]],  options)

  map("n", "<leader><tab>", [[<plug>(fzf-maps-n)]])
  map("x", "<leader><tab>", [[<plug>(fzf-maps-x)]])
  map("o", "<leader><tab>", [[<plug>(fzf-maps-o)]])

  vim.cmd [[command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)]]
  vim.cmd [[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)]]
end
