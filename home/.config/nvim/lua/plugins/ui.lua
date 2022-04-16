return function()
  vim.o.termguicolors = true
  vim.g.termcolors = 256

  vim.g.gruvbox_italic = 1
  vim.g.gruvbox_italicize_strings = 1
  vim.g.gruvbox_bold = 1

  vim.o.background = "dark"
  vim.cmd [[ colorscheme gruvbox ]]

  -- Clear SignColumns
  vim.cmd [[ hi clear SignColumn ]]

  hi("NormalFloat", {guibg = "none"})

  local nvim_tree_color_names = {
    "NvimTreeOpenedFolderName", "NvimTreeFolderName", "NvimTreeSymlink", "NvimTreeRootFolder", "NvimTreeFolderIcon",
    "NvimTreeEmptyFolderName", "NvimTreeExecFile", "NvimTreeSpecialFile", "NvimTreeImageFile", "NvimTreeMarkdownFile",
    "NvimTreeIndentMarker"
  }

  for index, color_name in ipairs(nvim_tree_color_names) do
    hi(color_name, {guifg = "#d4c5a2"})
  end

  hi("NvimTreeFileNew", {guifg = "#979922"})
  hi("NvimTreeFileDirty", {guifg = "#d59a27"})
  hi("NvimTreeOpenedFile", {guifg = "#6a9e6b"})
end
