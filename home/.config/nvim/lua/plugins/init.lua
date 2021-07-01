local ensurePackerInstalled = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
  end vim.cmd("packadd packer.nvim")
end
ensurePackerInstalled()

-- au("BufWritePost", "**/nvim/lua/plugins/*.lua", "lua reload()")
-- au("BufWritePost", "**/nvim/lua/plugins/*.lua", "PackerCompile")

local packer = {
  -- installer
  "wbthomason/packer.nvim",
  opt = true
}

local moving = {
  -- jump to definitions & etc
  {
    "pechorin/any-jump.vim",
    config = require("plugins.any-jump")
  },
  -- fast navigation with <leader>s +letter
  {
    'phaazon/hop.nvim',
    as = 'hop',
    config = require("plugins.hop"),
  },
  -- move lines or symbols, Alt-j
  "matze/vim-move",
  -- more useful word motions <leader>w|b|e
  {
    "chaoren/vim-wordmotion",
    config = require("plugins.wordmotion")
  },
}

local core = {
  -- delete buffer
  {
    "moll/vim-bbye",
    config = require("plugins.vim-bbye"),
  },
  -- delete all buffers except the current
  {
    "schickling/vim-bufonly",
    config = require("plugins.vim-bufonly"),
  },
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
  -- multiple Cursors like in IDE
  "mg979/vim-visual-multi",
  -- testing with hotkeys
  -- {
  --   "janko-m/vim-test",
  --   config = require("plugins.vim-test")
  -- },
  -- additional functional for %
  {
    "andymass/vim-matchup",
    config = require("plugins.matchup")
  },
  -- searching in file
  -- {
  --   "dyng/ctrlsf.vim",
  --   config = require("plugins.ctrlsf")
  -- },
  -- rename tags
  -- "AndrewRadev/tagalong.vim",
  -- timeout
}

local git = {
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    config = require("plugins.gitsigns"),
    requires = {
      'nvim-lua/plenary.nvim'
    }
  },
  -- git checkout
  {
    "stsewd/fzf-checkout.vim",
    config = require("plugins.fzf-checkout"),
  },
  -- :Git diff | :Git commit | :Git add | :GStatus
  "tpope/vim-fugitive",
  -- git blame
  { 
    "f-person/git-blame.nvim",
    config = require("plugins.git-blame"),
  },
}

local tmux = {
  {
    "numToStr/Navigator.nvim",
    config = require("plugins.navigator"),
  },
  {
    "talek/obvious-resize",
    config = require("plugins.obvious-resize"),
  }
}

local session = {
  -- start screen
  {
    "mhinz/vim-startify",
    config = require("plugins.startify"),
  },
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

local search_and_replace = {
  {
    "junegunn/fzf.vim",
    requires = {{
      "junegunn/fzf",
      run = "./install --all",
    }},
    config = require("plugins.fzf")
  },
  "gfanto/fzf-lsp.nvim",
  -- Replace all occurrences
  {
    "windwp/nvim-spectre",
    config = require('plugins.spectre'),
    requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"}
  }
}

local coding = {
  -- snippets
  {
    "hrsh7th/vim-vsnip",
    config = require("plugins.vim-vsnip")
  },
  -- auto close parentheses and repeat by .
  {
    "windwp/nvim-autopairs",
    config = require("plugins.nvim-autopairs"),
  },
  -- add switch toggles, -
  {
    "AndrewRadev/switch.vim",
    config = require("plugins.switch")
  },
  -- split or join lines, gS, gJ
  "AndrewRadev/splitjoin.vim",
  -- surrounding parentheses, brackets, quotes, XML tags, and more.
  "tpope/vim-surround",
  -- fast comment/uncomment lines, gcc
  "tpope/vim-commentary",
  -- commenting for jsx/tsx
  "JoosepAlviste/nvim-ts-context-commentstring",
  -- database for vim
  -- {
  --   "tpope/vim-dadbod",
  --   config = require("plugins.dadbod")
  -- },
  -- interactive db in buffer
  -- "kristijanhusak/vim-dadbod-ui",
  -- HTML shortcuts
  {
    "mattn/emmet-vim",
    config = require("plugins.emmet")
  },
  -- preview markdown files
  -- "shime/vim-livedown",
  -- support differnt tags like <%= %>
  -- "tpope/vim-ragtag"
}

local ui = {
  -- shade inactive windows
  {
    "sunjon/shade.nvim",
    config = require("plugins.shade"),
  },
  -- indent lines
  {
    "lukas-reineke/indent-blankline.nvim",
    branch = "lua",
    setup = function() 
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"

      vim.g.indent_blankline_use_treesitter = true
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
      vim.wo.colorcolumn = "99999"

      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "startify"}
      -- vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "startify", "NvimTree"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
    end
  },
  -- tabs
  {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = require("plugins.nvim-bufferline"),
  },
  -- status Line
  {
    "glepnir/galaxyline.nvim",
    config = require('plugins.galaxy-line')
  },
  -- show colors
  {
    "rrethy/vim-hexokinase",
    run = "make hexokinase",
    config = function()
      vim.g.Hexokinase_highlighters = {"backgroundfull"}
    end
  },
  -- brackets
  {
    "p00f/nvim-ts-rainbow",
    config = require("plugins.nvim-ts-rainbow"),
  },
  -- color scheme
  {
    "morhetz/gruvbox",
    -- "Th3Whit3Wolf/one-nvim",
    -- "savq/melange",
    -- "sainnhe/sonokai",
    config = require("plugins.ui"),
  }
}

local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  config = require('plugins.treesitter'),
  run = ':TSUpdate'
}

local lsp = {
  -- formatter
  {
    "mhartington/formatter.nvim",
    config = require("plugins.formatters"),
  },
  -- base config for language servers
  "neovim/nvim-lspconfig",
  {
    "kabouzeid/nvim-lspinstall",
    config = require("plugins.nvim-lspinstall")
  },
  -- more ts support
  "jose-elias-alvarez/nvim-lsp-ts-utils",
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
  {
    "hrsh7th/nvim-compe",
    config = require("plugins.nvim-compe"),
  }
}

local other = {
  "alex-popov-tech/timer.nvim",
  -- viewing nvim startup event timing information.
  "dstein64/vim-startuptime",
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
    use(search_and_replace)
    use(session)
    use(moving)
    use(tmux)
  end,
  config = {
    display = {
      open_fn = require("packer.util").float
    }
  }
}
