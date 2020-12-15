-- Check if the packer tool exists
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
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
-- ##################################################
-- #################---GENERAL---####################
-- ##################################################
  use { 'wbthomason/packer.nvim', opt = true }
  use 'tpope/vim-commentary'                                        -- Fast comment/uncomment lines, gcc
  use 'tpope/vim-surround'                                          -- Surrounding parentheses, brackets, quotes, XML tags, and more.
  use 'tpope/vim-repeat'                                            -- Repeat.vim remaps . in a way that plugins can tap into it.
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
  use 'tpope/vim-fugitive'                                          -- :Git diff | :Git commit | :Git add | :GStatus
  use 'numtostr/FTerm.nvim'                                         -- Terminal in NVIM

-- ##################################################
-- #################----THEMES----###################
-- ##################################################
  use 'kyazdani42/nvim-web-devicons'                                -- Icons
  use { 'kyazdani42/nvim-tree.lua',                                 -- Explorer Tree
    config = require('plugins.tree')
  }
  use { 'sainnhe/edge',
    config = require('ui'),
    as = 'colorscheme',
  }

-- ##################################################
-- #################----SEARCH----###################
-- ##################################################
  use 'easymotion/vim-easymotion'                                   -- Fast navigation with <leader>s +letter
  use 'pechorin/any-jump.vim'                                       -- Jump to definitions & etc
  use 'chaoren/vim-wordmotion'                                      -- More useful word motions <leader>w|b|e
  use 'farmergreg/vim-lastplace'                                    -- Reopen files at your last edit position
  use { 'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }
  use 'junegunn/fzf.vim'                                            -- Base search

-- ##################################################
-- #################-----LSP-----####################
-- ##################################################
  use {                                                             -- LSP
    'nvim-treesitter/nvim-treesitter',
    config = require('plugins.treesitter_config'),
    run = ':TSUpdate'
  }
end)
