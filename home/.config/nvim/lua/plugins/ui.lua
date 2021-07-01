return function()
  vim.o.termguicolors = true
  vim.g.termcolors = 256

  vim.cmd [[ colorscheme gruvbox ]]

  -- For operators highlighting
  vim.cmd [[ hi! link Operator GruvboxFg1 ]]

  -- Clear SignColumns
  vim.cmd [[ hi clear SignColumn ]]

  vim.cmd [[ hi NvimTreeFileNew     cterm=none ctermfg=none ctermbg=none gui=none guifg=#979922 guibg=none ]]
  vim.cmd [[ hi NvimTreeFileDirty   cterm=none ctermfg=none ctermbg=none gui=none guifg=#d59a27 guibg=none ]]

  -- vim.cmd [[ hi NvimTreeFileRenamed cterm=none ctermfg=none ctermbg=none gui=none guifg=#ffff00 guibg=none ]]
  -- vim.cmd [[ hi NvimTreeFileMerge   cterm=none ctermfg=none ctermbg=none gui=none guifg=#ff0000 guibg=none ]]
  -- vim.cmd [[ hi NvimTreeFileStaged  cterm=none ctermfg=none ctermbg=none gui=none guifg=#00afff guibg=none ]]
  --

  vim.cmd [[ hi NvimTreeFolderIcon  cterm=none ctermfg=none ctermbg=none gui=none guifg=#c5c5c5 guibg=none ]]
  vim.cmd [[ hi NvimTreeIndentMarker  cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]

  vim.cmd [[ hi NvimTreeOpenedFile cterm=none ctermfg=none ctermbg=none gui=none guifg=#6a9e6b guibg=none ]]
  vim.cmd [[ hi NvimTreeOpenedFolderName cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]

  vim.cmd [[ hi NvimTreeFolderName  cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeSymlink  cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeRootFolder cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeFolderIcon cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeEmptyFolderName cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeExecFile cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeSpecialFile cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeImageFile cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeMarkdownFile cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
  vim.cmd [[ hi NvimTreeIndentMarker cterm=none ctermfg=none ctermbg=none gui=none guifg=#d4c5a2 guibg=none ]]
end
