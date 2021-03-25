return function()
  local options = { noremap = true, silent = true }

  require('FTerm').setup({
    dimensions = { height = 0.8, width = 0.8, row = 0.5, col = 0.5 }
  })

  map('n', '<A-i>', [[:FTermToggle<CR>]],           options)
  map('t', '<A-i>', [[<C-\><C-n>:FTermToggle<CR>]], options)
end
