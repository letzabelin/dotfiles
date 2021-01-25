vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd BufWritePost **/nvim/lua/plugins/*.lua PackerCompile ]]

return require('packer').startup({
  function()
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
    use 'AndrewRadev/switch.vim'                                      -- Add switch toggles, -
    use 'tpope/vim-sensible'                                          -- Default additional configs
    use 'cohama/lexima.vim'                                           -- Auto close parentheses and repeat by .
    use 'mg979/vim-visual-multi'                                      -- Multiple Cursors like in IDE
    use 'janko-m/vim-test'                                            -- Testing with hotkeys
    use 'tpope/vim-fugitive'                                          -- :Git diff | :Git commit | :Git add | :GStatus
    use 'numtostr/FTerm.nvim'                                         -- Terminal in NVIM
    use 'andymass/vim-matchup'                                        -- Additional functional for %
    use 'dstein64/vim-startuptime'                                    -- Viewing nvim startup event timing information.
    use 'hrsh7th/vim-vsnip'                                           -- Snippets
    use 'hrsh7th/vim-vsnip-integ'                                     -- Snippets integration


    -- ##################################################
    -- #################--COMPLETION--###################
    -- ##################################################
    use 'kristijanhusak/vim-dadbod-completion'                        -- Completiton for DB
    use 'steelsojka/completion-buffers'                               -- Buffer completition
    use { 'nvim-lua/completion-nvim',                                 -- Completition support
      config = require('plugins.completion')
    }
    use { 'aca/completion-tabnine',
      run = './install.sh'
    }

    -- ##################################################
    -- #################------UI------###################
    -- ##################################################
    use 'kyazdani42/nvim-web-devicons'                                -- Icons
    use 'luochen1990/rainbow'                                         -- Brackets
    use { 'morhetz/gruvbox', config = require('plugins.ui') }         -- Colorscheme
    -- use { 'arcticicestudio/nord-vim', config = require('plugins.ui') }
    use { 'glepnir/galaxyline.nvim',                                  -- Status Line
      config = require('plugins.galaxy-line')
    }
    use { 'kyazdani42/nvim-tree.lua',                                 -- Explorer Tree
      config = require('plugins.tree')
    }
    use { 'romgrk/barbar.nvim',                                       -- Tabs
      config = require('plugins.barbar')
    }

    -- ##################################################
    -- #################------DB------###################
    -- ##################################################
    use 'tpope/vim-dadbod'                                            -- Database for vim
    use 'kristijanhusak/vim-dadbod-ui'                                -- Interactive db in buffer

    -- ##################################################
    -- #################--NAVIGATION--###################
    -- ##################################################
    use 'easymotion/vim-easymotion'                                   -- Fast navigation with <leader>s +letter
    use 'pechorin/any-jump.vim'                                       -- Jump to definitions & etc
    use 'chaoren/vim-wordmotion'                                      -- More useful word motions <leader>w|b|e
    use 'farmergreg/vim-lastplace'                                    -- Reopen files at your last edit position
    use 'dyng/ctrlsf.vim'                                             -- Searching in file
    use { 'junegunn/fzf',
      run = function()
        vim.fn['fzf#install']()
      end
    }
    use 'junegunn/fzf.vim'                                            -- Base search
    use 'gfanto/fzf-lsp.nvim'                                         -- Lsp support for fzf

    -- ##################################################
    -- #################--TEMPLATES--####################
    -- ##################################################
    use 'tpope/vim-ragtag'                                            -- Support differnt tags like <%= %>
    use 'AndrewRadev/tagalong.vim'                                    -- Rename tags
    use 'mattn/emmet-vim'                                             -- HTML shortcuts
    use 'shime/vim-livedown'                                          -- Preview markdown files

    -- ##################################################
    -- #################-----LSP-----####################
    -- ##################################################
    use {                                                             -- LSP
      'nvim-treesitter/nvim-treesitter',
      config = require('plugins.treesitter'),
      run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'                                       -- Base config for language servers
    -- use 'mattn/vim-lsp-settings'
    use { 'mhartington/formatter.nvim',                               -- Format files
      config = require('plugins.formatters')
    }
  end,
  config = { display = { open_fn = require("packer.util").float } }}
)
