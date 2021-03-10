return function()
  vim.g.nvcode_termcolors = 256
  vim.cmd [[ colorscheme nvcode ]]

  -- For operators highlighting
  vim.cmd [[ hi! link Operator GruvboxFg1 ]]

  vim.cmd [[ hi DiffAdd    cterm=none ctermfg=none ctermbg=none gui=none guifg=#5fd700 guibg=none ]]
  vim.cmd [[ hi DiffText   cterm=none ctermfg=none ctermbg=none gui=none guifg=#00afff guibg=none ]]
  vim.cmd [[ hi DiffChange cterm=none ctermfg=none ctermbg=none gui=none guifg=#ffff00 guibg=none ]]
  vim.cmd [[ hi DiffDelete cterm=none ctermfg=none ctermbg=none gui=none guifg=#ff0000 guibg=none ]]

  vim.cmd [[ hi LuaTreeFileNew     cterm=none ctermfg=none ctermbg=none gui=none guifg=#5fd700 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileDirty   cterm=none ctermfg=none ctermbg=none gui=none guifg=#ffff00 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileRenamed cterm=none ctermfg=none ctermbg=none gui=none guifg=#ffff00 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileMerge   cterm=none ctermfg=none ctermbg=none gui=none guifg=#ff0000 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileStaged  cterm=none ctermfg=none ctermbg=none gui=none guifg=#00afff guibg=none ]]
end
