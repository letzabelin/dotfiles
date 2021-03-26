return function()
  local options = { noremap = true, silent = true }

  vim.g.floaterm_width = 0.9
  vim.g.floaterm_height = 0.9
  map("n", "<A-i>", [[:FloatermToggle<CR>]],           options)
  map("t", "<A-i>", [[<C-\><C-n>:FloatermToggle<CR>]], options)
  map("n", '<A-g>', [[:FloatermNew lazygit<CR>]], options)
end
