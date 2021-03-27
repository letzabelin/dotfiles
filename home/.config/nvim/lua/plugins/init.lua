local ensurePackerInstalled = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
  end
  vim.cmd("packadd packer.nvim")
end
ensurePackerInstalled()

vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd BufWritePost **/nvim/lua/plugins/*.lua PackerCompile ]]

local packer = {
  -- installer
  "wbthomason/packer.nvim",
  opt = true
}

local textObjects = {
  -- more useful word motions <leader>w|b|e
  "chaoren/vim-wordmotion",
  config = require("plugins.wordmotion")
}

local core = {
  -- surrounding parentheses, brackets, quotes, XML tags, and more.
  "tpope/vim-surround",
  -- repeat.vim remaps . in a way that plugins can tap into it.
  "tpope/vim-repeat",
  -- additional mappings, [<space> - add new line before cursor, [b - prev buffer and ]b - next buffer
  "tpope/vim-unimpaired",
  -- move lines or symbols, Alt-j
  "matze/vim-move",
  -- split or join lines, gS, gJ
  "AndrewRadev/splitjoin.vim",
  -- add switch toggles, -
  {
    "AndrewRadev/switch.vim",
    config = require("plugins.switch")
  },
  -- default additional configs
  "tpope/vim-sensible",
  -- auto close parentheses and repeat by .
  "cohama/lexima.vim",
  -- multiple Cursors like in IDE
  "mg979/vim-visual-multi",
  -- testing with hotkeys
  {
    "janko-m/vim-test",
    config = require("plugins.vim-test")
  },
  -- additional functional for %
  {
    "andymass/vim-matchup",
    config = require("plugins.matchup")
  },
  -- snippets
  {
    "hrsh7th/vim-vsnip",
    config = require("plugins.vim-vsnip")
  },
  -- fast navigation with <leader>s +letter
  {
    "easymotion/vim-easymotion",
    config = require("plugins.easymotion")
  },
  -- jump to definitions & etc
  {
    "pechorin/any-jump.vim",
    config = require("plugins.any-jump")
  },
  -- searching in file
  {
    "dyng/ctrlsf.vim",
    config = require("plugins.ctrlsf")
  },
  -- rename tags
  "AndrewRadev/tagalong.vim",
  -- timeout
  "alex-popov-tech/timer.nvim",
}

local git = {
  -- :Git diff | :Git commit | :Git add | :GStatus
  "tpope/vim-fugitive",
  -- signs on the left side
  {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = require("plugins.gitsigns")
  }
}

local session = {
  -- reopen files at your last edit position
  "farmergreg/vim-lastplace"
}

local term = {
  -- terminal in NVIM
  "voldikss/vim-floaterm",
  config = require("plugins.vim-floaterm")
}

local filetree = {
  -- explorer tree
  "kyazdani42/nvim-tree.lua",
  requires={
    "kyazdani42/nvim-web-devicons",
  },
  config = require('plugins.nvim-tree')
}

local fuzzy_finder = {
  {
    "junegunn/fzf.vim",
    requires = {{
      "junegunn/fzf",
      run = "./install --all",
    }},
    config = require("plugins.fzf")
  },
  "gfanto/fzf-lsp.nvim",
}

local coding = {
  -- fast comment/uncomment lines, gcc
  "tpope/vim-commentary",
  -- database for vim
  {
    "tpope/vim-dadbod",
    config = require("plugins.dadbod")
  },
  -- interactive db in buffer
  "kristijanhusak/vim-dadbod-ui",
  -- HTML shortcuts
  {
    "mattn/emmet-vim",
    config = require("plugins.emmet")
  },
  -- preview markdown files
  "shime/vim-livedown",
  -- support differnt tags like <%= %>
  "tpope/vim-ragtag"
}

local ui = {
  -- status Line
  {
    "glepnir/galaxyline.nvim",
    config = require('plugins.galaxy-line')
  },
  -- color switcher
  "christianchiarulli/nvcode-color-schemes.vim",
  -- brackets
  {
    "luochen1990/rainbow",
    config = require("plugins.rainbow")
  },
  -- color scheme
  {
    'morhetz/gruvbox',
    config = require('plugins.ui'),
  }
}

local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  config = require('plugins.treesitter'),
  run = ':TSUpdate'
}

local lsp = {
  -- base config for language servers
  "neovim/nvim-lspconfig",
  -- pretty hover and references/implementations/codeaction
  {
    "glepnir/lspsaga.nvim",
    config = require("plugins.lspsaga-nvim"),
  },
  -- pretty references/codeaction
  {
    "RishabhRD/nvim-lsputils",
    requires = {
      "RishabhRD/popfix",
    },
    config = require("plugins.nvim-lsputils"),
  },
  -- format files
  -- {
  --   "mhartington/formatter.nvim",
  --   config = require('plugins.formatters')
  -- },
  {
    "hrsh7th/nvim-compe",
    config = require("plugins.nvim-compe"),
  }
}

local other = {
  -- viewing nvim startup event timing information.
  "dstein64/vim-startuptime",
  -- autocorrect words
  -- {
  --   "sedm0784/vim-you-autocorrect",
  --   config = require("plugins.vim-you-autocorrect"),
  -- }
}

return require('packer').startup {
  function(use)
    use(packer)
    use(core)
    use(term)
    use(filetree)
    use(coding)
    use(treesitter)
    use(git)
    use(ui)
    use(lsp)
    use(other)
    use(fuzzy_finder)
    use(session)
    use(textObjects)
  end,
  config = {
    display = {
      open_fn = require("packer.util").float
    }
  }
}
