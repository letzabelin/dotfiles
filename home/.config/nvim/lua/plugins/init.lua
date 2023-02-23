local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') ..
  '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd('cnoreabbrev psync PackerSync')
vim.cmd('cnoreabbrev pcomp PackerCompile')
vim.cmd('cnoreabbrev pinst PackerInstall')

local core = {
  -- cache modules to improve load time
  "lewis6991/impatient.nvim",
  -- improve load time with better 'filetype'
  "nathom/filetype.nvim",
  -- editorconfig
  "editorconfig/editorconfig-vim",
  -- show registers
  "tversteeg/registers.nvim",
  -- repeat.vim remaps . in a way that plugins can tap into it.
  "tpope/vim-repeat",
  -- additional mappings, [<space> - add new line before cursor, [b - prev buffer and ]b - next buffer
  "tpope/vim-unimpaired",
  -- default additional configs
  "tpope/vim-sensible",
  -- better yank
  "svban/YankAssassin.vim",

  -- removes cursor jumping when opening qf,etc.
  { "luukvbaal/stabilize.nvim", config = require("plugins.stabilize-nvim") },
  -- delete buffer
  { "moll/vim-bbye", config = require("plugins.vim-bbye") },
  -- delete all buffers except the current
  { "schickling/vim-bufonly", config = require("plugins.vim-bufonly") },
  -- additional functional for %
  { "andymass/vim-matchup", config = require("plugins.matchup") },
  -- text editing in Neovim with immediate visual feedback
  { "smjonas/live-command.nvim", config = require("plugins.live-command") },

  -- fix performance bug https://github.com/neovim/neovim/issues/12587 for CursorHold CursorHoldI
  {
    "antoinemadec/FixCursorHold.nvim",
    config = function()
      vim.g.cursorhold_updatetime = 200
    end
  },
}

local navigation = {
  -- move lines or symbols, Alt-j
  "matze/vim-move",

  -- fast navigation
  { "ggandor/lightspeed.nvim", requires = {"tpope/vim-repeat"} },
  -- more useful word motions <leader>w|b|e
  { "chaoren/vim-wordmotion", config = require("plugins.wordmotion") },
}

local git = {
  -- :Git diff | :Git commit | :Git add | :GStatus
  "tpope/vim-fugitive",

  -- git blame
  { "f-person/git-blame.nvim", config = require("plugins.git-blame") },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    config = require("plugins.gitsigns"),
    requires = { "nvim-lua/plenary.nvim" },
    tag = "release"
  },
}

local tmux = {
  { "numToStr/Navigator.nvim", config = require("plugins.navigator") },
  { "talek/obvious-resize", config = require("plugins.obvious-resize") },
}

local session = {
  -- reopen files at your last edit position
  "farmergreg/vim-lastplace",

  -- start screen
  {
    "goolord/alpha-nvim",
    requires = {'kyazdani42/nvim-web-devicons'},
    config = require("plugins.alpha")
  },
}

local term = {
  -- terminal in NVIM
  "voldikss/vim-floaterm",
  config = require("plugins.vim-floaterm")
}

local filetree = {
  -- explorer tree
  "kyazdani42/nvim-tree.lua",
  requires = { "kyazdani42/nvim-web-devicons" },
  config = require("plugins.nvim-tree")
}

local search = {
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    config = require("plugins.telescope-nvim")
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  },
  -- Replace all occurrences
  {
    "windwp/nvim-spectre",
    config = require("plugins.spectre"),
    requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"},
    cmd = "Replace"
  },
}

local coding = {
  -- split or join lines, gS, gJ
  "AndrewRadev/splitjoin.vim",
  -- surrounding parentheses, brackets, quotes, XML tags, and more.
  "tpope/vim-surround",
  -- fast comment/uncomment lines, gcc
  "tpope/vim-commentary",
  -- commenting for jsx/tsx
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- auto close parentheses and repeat by .
  { "windwp/nvim-autopairs", config = require("plugins.nvim-autopairs") },
  -- add switch toggles, -
  { "AndrewRadev/switch.vim", config = require("plugins.switch") },
  -- dotend support
  { "tpope/vim-dotenv", config = require("plugins.vim-dotenv") },
  -- emmet support
  { "mattn/emmet-vim", config = require("plugins.emmet") },
  -- preview markdown files
  { "iamcco/markdown-preview.nvim", run = "cd app && npm install" },

  -- snippets
  {
    "hrsh7th/vim-vsnip",
    requires = "hrsh7th/vim-vsnip-integ",
    config = require("plugins.vim-vsnip")
  },
}

local ui = {
  -- indent lines
  { "lukas-reineke/indent-blankline.nvim", config = require("plugins.indent-line") },
  -- tabs
  { "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons", config = require("plugins.nvim-bufferline") },
  -- status Line
  { "windwp/windline.nvim", config = require("plugins.windline-nvim") },
  -- highlight params in functions
  {"m-demare/hlargs.nvim", config = function() require'hlargs'.setup {} end},
  -- color scheme
  -- { "catppuccin/nvim", as = "catppuccin", config = require("plugins.catppuccin") },
  {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"},
    config = require("plugins.ui")
  },
  -- { "projekt0n/github-nvim-theme", tag = "v0.0.7", config = require("plugins.github-nvim-theme") },
}

local treesitter = {
  "nvim-treesitter/playground",
  {
    "nvim-treesitter/nvim-treesitter",
    config = require("plugins.treesitter"),
    run = ":TSUpdate"
  },
}

local lsp = {
  "hrsh7th/cmp-nvim-lsp",
  -- base config for language servers
  "neovim/nvim-lspconfig",
  -- lsp servers installer
  {"williamboman/nvim-lsp-installer"},
  -- just a bit better ts support
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  -- pretty references/codeaction
  {"RishabhRD/nvim-lsputils", requires = {"RishabhRD/popfix"}, config = require("plugins.nvim-lsputils")},
  {
    "hrsh7th/nvim-cmp",
    config = require("plugins.nvim-cmp"),
    requires = {
      "onsails/lspkind-nvim",
      "f3fora/cmp-spell",
      "octaltree/cmp-look",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-emoji",
      {
        "tzachar/cmp-fuzzy-buffer",
        requires = {
          {
            "tzachar/fuzzy.nvim",
            requires = {{"hrsh7th/cmp-buffer"}, {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}}
          }
        }
      },
      {
        "tzachar/cmp-fuzzy-path",
        requires = {
          {
            "tzachar/fuzzy.nvim",
            requires = {{"hrsh7th/cmp-path"}, {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}}
          }
        }
      }
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = require("plugins.null-ls"),
    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  },
  -- code action
  {"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"},
  -- diagnostics
  {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = require("plugins.trouble-nvim")},
}

local other = {
  -- viewing nvim startup event timing information.
  "dstein64/vim-startuptime",
}

return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"
    use(core)
    use(term)
    use(filetree)
    use(coding)
    use(treesitter)
    use(git)
    use(ui)
    use(lsp)
    use(other)
    use(search)
    use(session)
    use(navigation)
    use(tmux)
  end,
  config = {
    display = {
      open_fn = require("packer.util").float
    }
  }
}
