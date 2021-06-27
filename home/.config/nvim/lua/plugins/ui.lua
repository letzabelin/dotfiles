return function()
  vim.o.termguicolors = true
  vim.g.termcolors = 256

  vim.cmd [[ colorscheme gruvbox ]]

  -- For operators highlighting
  vim.cmd [[ hi! link Operator GruvboxFg1 ]]

  -- Clear SignColumns
  vim.cmd [[ hi clear SignColumn ]]

  vim.cmd [[ hi LuaTreeFileNew     cterm=none ctermfg=none ctermbg=none gui=none guifg=#5fd700 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileDirty   cterm=none ctermfg=none ctermbg=none gui=none guifg=#ffff00 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileRenamed cterm=none ctermfg=none ctermbg=none gui=none guifg=#ffff00 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileMerge   cterm=none ctermfg=none ctermbg=none gui=none guifg=#ff0000 guibg=none ]]
  vim.cmd [[ hi LuaTreeFileStaged  cterm=none ctermfg=none ctermbg=none gui=none guifg=#00afff guibg=none ]]
end
