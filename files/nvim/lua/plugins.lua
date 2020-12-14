-- Check if the packer tool exists
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  -- TODO: Maybe handle windows better?
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/pack/packer/opt/',
    vim.fn.stdpath('config')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
-- ############# General #############
  use { 'wbthomason/packer.nvim', opt = true }
  use 'tpope/vim-commentary' 				            -- Fast comment/uncomment lines, gcc
  use 'tpope/vim-surround'  					    --Surrounding parentheses, brackets, quotes, XML tags, and more.
  use 'tpope/vim-repeat'  					    --Repeat.vim remaps . in a way that plugins can tap into it.
  use 'tpope/vim-unimpaired'                                        -- Additional mappings, [<space> - add new line before cursor, [b - prev buffer and ]b - next buffer
  use 'matze/vim-move'                                              -- Move lines or symbols, Alt-j
  use 'AndrewRadev/splitjoin.vim'                                   -- Split or join lines, gS, gJ
  use 'tpope/vim-abolish'                                           -- Abbreviations
  use 'nathanaelkane/vim-indent-guides'                             -- Highlight indent lines
  use 'AndrewRadev/switch.vim'                                      -- Add switch toggles, -
  use 'dyng/ctrlsf.vim'                                             -- Searching in file
  use 'tpope/vim-sensible'                                          -- Default additional configs
  use 'cohama/lexima.vim'                                           -- Auto close parentheses and repeat by .
  use 'terryma/vim-multiple-cursors'                                -- Multiple Cursors like in IDE
  use 'janko-m/vim-test'                                            -- Testing with hotkeys
  use 'svermeulen/vimpeccable'                                      -- Use Lua to configure vim

-- ############# Search and navigation #############
  use 'easymotion/vim-easymotion'                                   -- Fast navigation with <leader>s +letter
  use 'pechorin/any-jump.vim'                                       -- Jump to definitions & etc
  use 'chaoren/vim-wordmotion'                                      -- More useful word motions <leader>w|b|e
  use 'farmergreg/vim-lastplace'                                    -- Reopen files at your last edit position
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
-- Plug 'tpope/vim-fugitive'                                          -- :Git diff | :Git commit | :Git add | :GStatus
-- Plug 'tpope/vim-git'                                               -- Syntax, indent, and filetype plugin files for git, gitconfig etc.
end)
