-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/letzabelin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/letzabelin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/letzabelin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/letzabelin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/letzabelin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1�\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\5\0'\3\b\0'\4\t\0B\0\4\0016\0\4\0'\2\5\0'\3\n\0'\4\v\0B\0\4\0016\0\4\0'\2\5\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\5\bmap\1\0\2\14auto_save\fcurrent\20disable_on_zoom\1\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n�\14\0\0\t\0\31\1=6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\a\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\5\0039\4\b\1'\6\24\0'\a\25\0'\b\26\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\27\0026\3\0\0'\5\28\0B\3\2\2B\3\1\2=\3\5\0029\2\29\0009\4\30\1B\2\2\1K\0\1\0\topts\nsetup\18alpha.fortune\vfooter\f:qa<CR>\21  > Quit NVIM\6q\21:PackerClean<CR>\27P  > Plugins - Cleanup\6c\20:PackerSync<CR>\24P  > Plugins - Sync\6s\23:PackerInstall<CR>\27P  > Plugins - Install\6i\28:Telescope oldfiles<CR>\18  > Recent\6r :ene <BAR> startinsert <CR>\20  > New file\6e\vbutton\fbuttons\1\15\0\0:                                                     :                                                     :                                                     :                                                     :                                                     :                                                     :                                                     �\1  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ �\1  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ �\1  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ �\1  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ �\1  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ �\1  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ :                                                     \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\r����\4\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-fuzzy-buffer"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
  },
  ["cmp-fuzzy-path"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-path",
    url = "https://github.com/tzachar/cmp-fuzzy-path"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-look",
    url = "https://github.com/octaltree/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\b\0\t6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1=\1\2\0K\0\1\0\15javascript\1\0\1\fextends\bjsx\thtml\1\0\0\1\0\1\24indent_blockelement\3\1\24user_emmet_settings\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  ["git-blame.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\t\0\0146\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\1K\0\1\0\28<cmd>GitBlameToggle<cr>\15<leader>gm\6n\bmap0<author> • <sha> • <date> • <summary>\30gitblame_message_template\21gitblame_enabled\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3�\a\nsigns\1\0\5\22use_internal_diff\2\23use_decoration_api\2\20update_debounce\3d\nnumhl\2\18sign_priority\3\6\17changedelete\1\0\3\nnumhl\5\ahl\20GitGutterDelete\ttext\b│\14topdelete\1\0\3\nnumhl\5\ahl\20GitGutterDelete\ttext\b│\vdelete\1\0\3\nnumhl\5\ahl\20GitGutterDelete\ttext\b│\vchange\1\0\3\nnumhl\5\ahl\20GitGutterChange\ttext\b│\badd\1\0\0\1\0\3\nnumhl\5\ahl\17GitGutterAdd\ttext\b│\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\n\0\25\0<6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0)\1\0\1=\1\4\0006\0\0\0009\0\3\0)\1\1\0=\1\5\0006\0\0\0009\0\3\0)\1\1\0=\1\6\0006\0\0\0009\0\3\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0'\2\v\0B\0\2\0016\0\0\0009\0\n\0'\2\f\0B\0\2\0016\0\r\0'\2\14\0005\3\15\0B\0\3\0015\0\16\0006\1\17\0\18\3\0\0B\1\2\4X\4\4�6\6\r\0\18\b\5\0005\t\18\0B\6\3\1E\4\3\3R\4�6\1\r\0'\3\19\0005\4\20\0B\1\3\0016\1\r\0'\3\21\0005\4\22\0B\1\3\0016\1\r\0'\3\23\0005\4\24\0B\1\3\1K\0\1\0\1\0\1\nguifg\f#6a9e6b\23NvimTreeOpenedFile\1\0\1\nguifg\f#d59a27\22NvimTreeFileDirty\1\0\1\nguifg\f#979922\20NvimTreeFileNew\1\0\1\nguifg\f#d4c5a2\vipairs\1\f\0\0\29NvimTreeOpenedFolderName\23NvimTreeFolderName\20NvimTreeSymlink\23NvimTreeRootFolder\23NvimTreeFolderIcon\28NvimTreeEmptyFolderName\21NvimTreeExecFile\24NvimTreeSpecialFile\22NvimTreeImageFile\25NvimTreeMarkdownFile\25NvimTreeIndentMarker\1\0\1\nguibg\tnone\16NormalFloat\ahi\26 hi clear SignColumn \26 colorscheme gruvbox \bcmd\tdark\15background\17gruvbox_bold\30gruvbox_italicize_strings\19gruvbox_italic\15termcolors\6g\18termguicolors\6o\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0\20\0)6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\f\0'\1\14\0=\1\r\0006\0\15\0'\2\16\0B\0\2\0029\0\17\0005\2\18\0004\3\0\0=\3\19\2B\0\2\1K\0\1\0\24char_highlight_list\1\0\0\nsetup\21indent_blankline\frequire\n99999\16colorcolumn\awo\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\5\0\0\thelp\rterminal\nalpha\rNvimTree&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent$indent_blankline_use_treesitter\b▏\26indent_blankline_char\23indentLine_enabled\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\f\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0004\3\3\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\0049\4\6\0045\6\a\0B\4\2\2>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\t\4>\4\2\3=\3\v\2B\0\2\1K\0\1\0\fsources\1\0\0\14prettierd\15formatting\1\0\1\ftimeout\3�N\twith\reslint_d\16diagnostics\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nU\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0'\2\r\0'\3\14\0'\4\15\0B\0\4\0016\0\f\0'\2\r\0'\3\16\0'\4\17\0B\0\4\1K\0\1\0\29:BufferLineCyclePrev<cr>\14<leader>p\29:BufferLineCycleNext<cr>\14<leader>n\6n\bmap\15highlights\tfill\1\0\0\1\0\1\nguibg\f#1e1e1e\foptions\1\0\0\foffsets\1\0\n\24show_tab_indicators\2\rtab_size\3\25\22max_prefix_length\3\0\20max_name_length\3#\20show_close_icon\1\18modified_icon\b\22buffer_close_icon\b\20separator_style\tthin\28show_buffer_close_icons\2\25enforce_regular_tabs\1\1\0\3\fpadding\3\1\rfiletype\rNvimTree\ttext\5\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\a\2\0266\0\0\0009\0\1\0'\2\2\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17�6\1\0\0009\1\3\1'\3\2\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2\v\1\0\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\2\0]\0\2\n\0\4\0\0186\2\0\0009\2\1\2\18\4\0\0B\2\2\2!\2\2\1'\3\2\0)\4\1\0\18\5\2\0)\6\1\0M\4\4�\18\b\3\0'\t\3\0&\3\t\bO\4�\18\4\0\0\18\5\3\0&\4\5\4L\4\2\0\6 \5\blen\vstring;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\1\0\2\b\2\a\0\0225\2\0\0009\3\1\0009\3\2\0038\3\3\2\v\3\0\0X\4\2�=\3\3\1X\4\a�-\4\0\0009\6\4\1)\a\b\0B\4\3\2\18\5\3\0&\4\5\4=\4\3\1-\4\1\0009\4\5\0049\6\4\0015\a\6\0B\4\3\2=\4\4\1L\1\2\0\5�\3�\1\0\1\14with_text\1\rsymbolic\tkind\tmenu\tname\vsource\1\0\6\rnvim_lua\n|api|\15fuzzy_path\v|fpth|\17fuzzy_buffer\v|fbuf|\rnvim_lsp\n|lsp|\vbuffer\n|buf|\tpath\n|pth|�\1\0\1\t\1\n\1 6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\14�6\1\0\0009\1\1\0019\1\3\0016\3\0\0009\3\4\0039\3\5\3'\5\6\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\a\0B\1\3\1X\1\v�-\1\0\0009\1\b\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\t\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_next_item\fvisible\5!<Plug>(vsnip-expand-or-jump)\27nvim_replace_termcodes\bapi\rfeedkeys\20vsnip#available\afn\bvim\2�\1\0\1\t\1\n\1 6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\14�6\1\0\0009\1\1\0019\1\3\0016\3\0\0009\3\4\0039\3\5\3'\5\6\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\a\0B\1\3\1X\1\v�-\1\0\0009\1\b\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\t\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_next_item\fvisible\5\28<Plug>(vsnip-jump-prev)\27nvim_replace_termcodes\bapi\rfeedkeys\20vsnip#available\afn\bvim\2�\v\1\0\16\0M\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0023\4\5\0003\5\6\0009\6\a\0005\b\t\0005\t\b\0=\t\n\b5\t\v\0=\t\f\b5\t\14\0003\n\r\0=\n\15\t=\t\16\b5\t\18\0005\n\17\0=\n\19\t3\n\20\0=\n\21\t=\t\22\b4\t\5\0005\n\23\0>\n\1\t5\n\24\0>\n\2\t5\n\25\0>\n\3\t5\n\26\0>\n\4\t=\t\27\b5\t\31\0009\n\28\0009\f\28\0009\f\29\fB\f\1\0025\r\30\0B\n\3\2=\n \t9\n\28\0009\n!\n)\f��B\n\2\2=\n\"\t9\n\28\0009\n!\n)\f\4\0B\n\2\2=\n#\t9\n\28\0009\f\28\0009\f$\f5\14'\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r)\0B\n\3\2=\n*\t9\n\28\0009\f\28\0009\f+\f5\14,\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r-\0B\n\3\2=\n.\t9\n\28\0009\f\28\0009\f$\f5\14/\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r0\0B\n\3\2=\n1\t9\n\28\0009\f\28\0009\f+\f5\0142\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r3\0B\n\3\2=\n4\t9\n\28\0009\f\28\0009\f5\f5\0147\0009\0156\0009\15&\15=\15(\14B\f\2\0025\r8\0B\n\3\2=\n9\t9\n\28\0003\f:\0005\r;\0B\n\3\2=\n<\t9\n\28\0003\f=\0005\r>\0B\n\3\2=\n?\t=\t\28\bB\6\2\0016\6@\0'\bA\0'\tB\0'\nC\0'\vD\0'\fE\0'\rF\0&\n\r\nB\6\4\0016\6@\0'\bA\0'\tG\0'\nH\0'\vI\0'\fJ\0'\rK\0'\14L\0&\n\14\nB\6\4\0012\0\0�K\0\1\0\t } }+{ name = 'look', max_item_count = 10 }-{ name = 'emoji', max_item_count = 20 },-{ name = 'spell', max_item_count = 10 },1lua require'cmp'.setup.buffer { sources = { \23gitcommit,markdown\b}})/{ name = \"nvim_lsp\", max_item_count = 20 }\27{ name = \"nvim_lua\" },0lua require\"cmp\".setup.buffer({ sources = {\blua\rfiletype\aau\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\3\0\0\6i\6s\1\0\1\vselect\2\20ConfirmBehavior\fconfirm\t<Up>\1\3\0\0\6i\6s\1\0\0\v<Down>\1\3\0\0\6i\6s\1\0\0\n<C-p>\1\3\0\0\6i\6s\1\0\0\21select_prev_item\n<C-n>\1\3\0\0\6i\6s\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\n<C-f>\n<C-d>\16scroll_docs\14<C-Space>\1\0\0\1\3\0\0\6i\6c\rcomplete\fmapping\fsources\1\0\1\tname\nvsnip\1\0\2\tname\tpath\rpriority\3\1\1\0\2\tname\vbuffer\19max_item_count\3\n\1\0\2\tname\rnvim_lsp\19max_item_count\3\n\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\fsnippet\vexpand\1\0\0\0\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15completion\1\0\0\1\0\1\16completeopt#menu,menuone,noinsert,noselect\nsetup\0\0\flspkind\23cmp.config.compare\14cmp.types\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    config = { "\27LJ\2\n�\5\0\0\4\0\23\0A6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-lsputils",
    url = "https://github.com/RishabhRD/nvim-lsputils"
  },
  ["nvim-spectre"] = {
    commands = { "Replace" },
    config = { "\27LJ\2\n�\2\0\0\4\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0002command! Replace :lua require'spectre'.open()\17nvim_command\bapi\bvim\14highlight\1\0\3\vsearch\15DiffDelete\freplace\15DiffChange\aui\vString\1\0\4\rline_sep1└-----------------------------------------\19result_padding\t¦  \19line_sep_start1┌-----------------------------------------\19color_devicons\2\nsetup\fspectre\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0 \0%6\0\0\0'\2\1\0'\3\2\0'\4\3\0005\5\4\0B\0\5\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\0025\3\19\0005\4\20\0=\4\21\0035\4\23\0005\5\22\0=\5\24\0045\5\25\0005\6\26\0=\6\f\0055\6\27\0=\6\28\5=\5\29\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\rrenderer\nicons\vglyphs\vfolder\1\0\4\topen\b\17arrow_closed\b\15arrow_open\b\fdefault\b\1\0\5\14untracked\5\frenamed\5\runmerged\5\vstaged\5\runstaged\5\1\0\2\fsymlink\b\fdefault\b\tshow\1\0\0\1\0\4\17folder_arrow\2\bgit\2\tfile\2\vfolder\2\19indent_markers\1\0\1\venable\2\1\0\2\27highlight_opened_files\tname\18highlight_git\2\factions\14open_file\1\0\0\1\0\1\17quit_on_open\2\tview\1\0\2\tside\tleft\nwidth\3#\bgit\1\0\1\vignore\1\24update_focused_file\1\0\0\1\0\1\venable\2\nsetup\14nvim-tree\frequire\1\0\1\fnoremap\2\24:NvimTreeToggle<cr>\21<leader><leader>\6n\bmap\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\frainbow\vcolors\1\b\0\0\f#bf616a\f#d08770\f#ebcb8b\f#a3be8c\f#88c0d0\f#5e81ac\f#b48ead\1\0\3\19max_file_lines\3�\a\venable\2\18extended_mode\2\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\vindent\venable\1\0\0\1\2\0\0\20javascriptreact\21ensure_installed\1\0\0\1\v\0\0\15javascript\thtml\bcss\truby\tjson\fclojure\tbash\blua\verlang\velixir\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["obvious-resize"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\14\0\0296\0\0\0009\0\1\0)\1\4\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\5\0'\3\b\0'\4\t\0B\0\4\0016\0\4\0'\2\5\0'\3\n\0'\4\v\0B\0\4\0016\0\4\0'\2\5\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0\28:ObviousResizeRight<cr>\14<c-right>\27:ObviousResizeLeft<cr>\r<c-left>\27:ObviousResizeDown<cr>\r<c-down>\25:ObviousResizeUp<cr>\v<c-up>\5\bmap\28obvious_resize_run_tmux\27obvious_resize_default\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/obvious-resize",
    url = "https://github.com/talek/obvious-resize"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["shade.nvim"] = {
    config = { "\27LJ\2\nh\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\tkeys\1\0\2\17opacity_step\3\1\20overlay_opacity\0032\nsetup\nshade\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/shade.nvim",
    url = "https://github.com/sunjon/shade.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["switch.vim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6-\19switch_mapping\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\r\0\0\n\0'\0f6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\b\0005\4\6\0005\5\4\0004\6\0\0=\6\5\5=\5\a\4=\4\t\3B\1\2\1'\1\n\0'\2\v\0006\3\f\0'\5\r\0'\6\14\0'\a\15\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\17\0'\a\18\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\19\0'\a\20\0\18\b\2\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\21\0'\a\22\0\18\b\2\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\23\0'\a\24\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\25\0'\a\26\0\18\b\2\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\27\0'\a\28\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\29\0'\a\30\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\31\0'\a \0B\3\4\0016\3\f\0'\5\r\0'\6!\0'\a\"\0B\3\4\0016\3\f\0'\5\r\0'\6#\0'\a$\0B\3\4\0016\3\f\0'\5\r\0'\6%\0'\a&\0B\3\4\1K\0\1\0;<CMD>lua require('telescope.builtin').git_status()<CR>\15<leader>gs=<CMD>lua require('telescope.builtin').git_branches()<CR>\15<leader>gb<<CMD>lua require('telescope.builtin').git_commits()<CR>\15<leader>gc7<CMD>lua require('telescope.builtin').resume()<CR>\15<leader>ooC<CMD>lua require('telescope.builtin').oldfiles({cwd_only=true,\15<leader>olG<CMD>lua require('telescope.builtin').buffers({sort_lastused=true,\14<leader>b�\1<CMD>lua require('telescope.builtin').grep_string({additional_args=function(options) return {'--hidden', '--no-ignore'} end,\agO8<CMD>lua require('telescope.builtin').grep_string({\ago�\1<CMD>lua require('telescope.builtin').live_grep({additional_args=function(options) return {'--hidden', '--no-ignore', '-F'} end,\15<leader>aAv<CMD>lua require('telescope.builtin').live_grep({additional_args=function(options) return {'--hidden', '-F'} end,\15<leader>aaC<CMD>lua require('telescope.builtin').find_files({hidden=true,\15<leader>ff\v})<CR>6<CMD>lua require('telescope.builtin').git_files({\15<leader>gf\6n\bmapWlayout_strategy='vertical',layout_config={width=0.9, height=0.9, preview_cutoff=0}hlayout_strategy='horizontal',layout_config={width=0.9, height=0.9, mirror=false, preview_width=0.4}\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nx\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\15auto_close\2\tmode\25document_diagnostics\25use_diagnostic_signs\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-bbye"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27cnoreabbrev bd Bdelete\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-bufonly"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25cnoreabbrev bo Bonly\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-bufonly",
    url = "https://github.com/schickling/vim-bufonly"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dotenv"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\6\0B\0\4\1K\0\1\0\16Dotenv .env\t.env\17BufWritePost2if !empty(glob('.env')) | Dotenv .env | endif\6*\rVimEnter\aau\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-dotenv",
    url = "https://github.com/tpope/vim-dotenv"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\15\1\0305\0\0\0006\1\1\0009\1\2\1*\2\0\0=\2\3\0016\1\1\0009\1\2\1*\2\0\0=\2\4\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\a\0'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\a\0'\3\v\0'\4\t\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\r\1'\3\14\0B\1\2\1K\0\1\0-hi FloatermBorder guibg=none guifg=none \bcmd\"<C-\\><C-n>:FloatermToggle<CR>\6t\24:FloatermToggle<CR>\n<c-e>\6n\bmap\rTERMINAL\19floaterm_title\20floaterm_height\19floaterm_width\6g\bvim\1\0\2\vsilent\2\fnoremap\2����\25̙��\3\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n{\0\0\4\0\a\0\f6\0\0\0+\1\1\0=\1\1\0006\0\0\0006\1\3\0009\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0K\0\1\0\14/snippets\vconfig\fstdpath\afn\22vsnip_snippet_dir\24vsnip_extra_mapping\6g\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["vim-wordmotion"] = {
    config = { "\27LJ\2\n5\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6,\22wordmotion_prefix\6g\bvim\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\n\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 �\1\0\1\a\0\6\0\t6\1\0\0009\1\1\1'\3\2\0\18\4\0\0005\5\4\0009\6\3\0=\6\5\5B\1\4\2L\1\2\0\17default_blue\1\0\b\bred\f#fc5d7c\tblue\f#78dce8\18file_modified\f#d59a27\17file_default\f#6a9e6b\tgrey\f#c0c0c0\vyellow\f#e5c463\abg\f#49464e\ngreen\f#9ecd6f\tblue\nforce\15tbl_extend\bvim�\3\0\0\f\0\26\0A'\0\0\0006\1\1\0009\1\2\0019\1\3\1\15\0\1\0X\2\1�'\0\4\0'\1\5\0006\2\1\0009\2\2\0029\2\6\2\15\0\2\0X\3\1�'\1\a\0006\2\1\0009\2\b\0029\2\t\0026\4\1\0009\4\b\0049\4\n\4'\6\v\0B\4\2\2'\5\f\0B\2\3\0026\3\1\0009\3\b\0039\3\n\3'\5\r\0B\3\2\0026\4\1\0009\4\b\0049\4\n\4'\6\14\0B\4\2\0026\5\15\0'\a\16\0B\5\2\0029\5\17\5\18\a\3\0\18\b\4\0B\5\3\0036\a\18\0'\t\19\0005\n\20\0\f\v\6\0X\v\1�'\v\21\0=\v\22\nB\a\3\0014\a\4\0005\b\23\0>\5\1\b>\b\1\a5\b\24\0>\b\2\a4\b\3\0\18\t\0\0\18\n\2\0&\t\n\t>\t\1\b5\t\25\0>\1\1\t>\t\2\b>\b\3\aL\a\2\0\1\3\0\0\0\abg\1\2\0\0\6 \1\3\0\0\0\16WL_icon_tmp\nguifg\nwhite\1\0\1\nguibg\f#49464e\16WL_icon_tmp\ahi\19get_icon_color\22nvim-web-devicons\frequire\b%:e\b%:t\t:~:.\6%\vexpand\16fnamemodify\afn\18file_modified\rmodified\17file_default\n🔒 \rreadonly\abo\bvim\5�\3\0\1\6\1\16\0002-\1\0\0009\1\0\1\18\3\0\0B\1\2\2\14\0\1\0X\1\2�'\1\1\0L\1\2\0004\1\6\0004\2\3\0-\3\0\0009\3\2\0035\5\3\0B\3\2\2>\3\1\0025\3\4\0>\3\2\2>\2\1\0015\2\5\0005\3\6\0>\3\2\2>\2\2\0014\2\3\0-\3\0\0009\3\a\0035\5\b\0B\3\2\2>\3\1\0025\3\t\0>\3\2\2>\2\3\0014\2\3\0-\3\0\0009\3\n\0035\5\v\0B\3\2\2>\3\1\0025\3\f\0>\3\2\2>\2\4\0014\2\3\0-\3\0\0009\3\r\0035\5\14\0B\3\2\2>\3\1\0025\3\15\0>\3\2\2>\2\5\1L\1\2\0\3�\1\3\0\0\tblue\abg\1\0\2\vformat\v 柳%s\14show_zero\2\17diff_changed\1\3\0\0\bred\abg\1\0\2\vformat\f  %s\14show_zero\2\17diff_removed\1\3\0\0\ngreen\abg\1\0\2\vformat\f  %s\14show_zero\2\15diff_added\1\3\0\0\ngreen\abg\1\2\0\0\n with\1\3\0\0\bred\abg\1\0\1\ticon\n  \15git_branch\5\vis_git�\2\0\1\6\1\v\0%-\1\0\0009\1\0\1\18\3\0\0B\1\2\2\14\0\1\0X\1\2�5\1\1\0L\1\2\0004\1\4\0004\2\3\0-\3\0\0009\3\2\0035\5\3\0B\3\2\2>\3\1\0025\3\4\0>\3\2\2>\2\1\0014\2\3\0-\3\0\0009\3\5\0035\5\6\0B\3\2\2>\3\1\0025\3\a\0>\3\2\2>\2\2\0014\2\3\0-\3\0\0009\3\b\0035\5\t\0B\3\2\2>\3\1\0025\3\n\0>\3\2\2>\2\3\1L\1\2\0\2�\1\3\0\0\17default_blue\abg\1\0\2\vformat\f  %s\14show_zero\2\rlsp_hint\1\3\0\0\vyellow\abg\1\0\2\vformat\f  %s\14show_zero\2\16lsp_warning\1\3\0\0\bred\abg\1\0\2\vformat\f  %s\14show_zero\2\14lsp_error\1\2\0\0\5\14check_lsp�\4\1\0\14\0\31\0=6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0024\4\3\0003\5\5\0>\5\1\0044\5\3\0009\6\6\1>\6\1\0059\6\a\0005\b\t\0003\t\b\0=\t\n\b4\t\3\0005\n\f\0005\v\v\0=\v\r\n4\v\6\0005\f\14\0003\r\15\0=\r\16\f>\f\1\v5\f\17\0003\r\18\0=\r\16\f>\f\2\v>\5\3\v5\f\19\0003\r\20\0=\r\16\f>\f\4\v>\4\5\v=\v\21\n4\v\0\0=\v\22\n>\n\1\t=\t\23\bB\6\2\0016\6\0\0'\b\24\0B\6\2\0029\6\a\0065\b\25\0005\t\26\0=\t\27\b5\t\28\0=\t\29\b4\t\0\0=\t\30\bB\6\2\0012\0\0�K\0\1\0\28floating_show_filetypes\19skip_filetypes\1\3\0\0\rNvimTree\blir\aui\1\0\2\16active_char\6-\17active_color\tblue\1\0\1\rinterval\3�\2\16wlfloatline\16statuslines\rinactive\vactive\0\1\0\1\tname\15diagnostic\0\1\0\1\tname\bgit\ttext\0\1\0\1\tname\tfile\14filetypes\1\0\0\1\2\0\0\fdefault\16colors_name\1\0\0\0\nsetup\fdivider\0\28windline.components.git\28windline.components.lsp\30windline.components.basic\rwindline\frequire\0" },
    loaded = true,
    path = "/Users/letzabelin/.local/share/nvim/site/pack/packer/start/windline.nvim",
    url = "https://github.com/windwp/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\15\1\0305\0\0\0006\1\1\0009\1\2\1*\2\0\0=\2\3\0016\1\1\0009\1\2\1*\2\0\0=\2\4\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\a\0'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\a\0'\3\v\0'\4\t\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\r\1'\3\14\0B\1\2\1K\0\1\0-hi FloatermBorder guibg=none guifg=none \bcmd\"<C-\\><C-n>:FloatermToggle<CR>\6t\24:FloatermToggle<CR>\n<c-e>\6n\bmap\rTERMINAL\19floaterm_title\20floaterm_height\19floaterm_width\6g\bvim\1\0\2\vsilent\2\fnoremap\2����\25̙��\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\n{\0\0\4\0\a\0\f6\0\0\0+\1\1\0=\1\1\0006\0\0\0006\1\3\0009\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0K\0\1\0\14/snippets\vconfig\fstdpath\afn\22vsnip_snippet_dir\24vsnip_extra_mapping\6g\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: switch.vim
time([[Config for switch.vim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6-\19switch_mapping\6g\bvim\0", "config", "switch.vim")
time([[Config for switch.vim]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\b\0\t6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1=\1\2\0K\0\1\0\15javascript\1\0\1\fextends\bjsx\thtml\1\0\0\1\0\1\24indent_blockelement\3\1\24user_emmet_settings\6g\bvim\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14fast_wrap\1\0\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\14\0\0\t\0\31\1=6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\a\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\5\0039\4\b\1'\6\24\0'\a\25\0'\b\26\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\27\0026\3\0\0'\5\28\0B\3\2\2B\3\1\2=\3\5\0029\2\29\0009\4\30\1B\2\2\1K\0\1\0\topts\nsetup\18alpha.fortune\vfooter\f:qa<CR>\21  > Quit NVIM\6q\21:PackerClean<CR>\27P  > Plugins - Cleanup\6c\20:PackerSync<CR>\24P  > Plugins - Sync\6s\23:PackerInstall<CR>\27P  > Plugins - Install\6i\28:Telescope oldfiles<CR>\18  > Recent\6r :ene <BAR> startinsert <CR>\20  > New file\6e\vbutton\fbuttons\1\15\0\0:                                                     :                                                     :                                                     :                                                     :                                                     :                                                     :                                                     �\1  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ �\1  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ �\1  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ �\1  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ �\1  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ �\1  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ :                                                     \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\r����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: vim-wordmotion
time([[Config for vim-wordmotion]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6,\22wordmotion_prefix\6g\bvim\0", "config", "vim-wordmotion")
time([[Config for vim-wordmotion]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\r\0\0\n\0'\0f6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\b\0005\4\6\0005\5\4\0004\6\0\0=\6\5\5=\5\a\4=\4\t\3B\1\2\1'\1\n\0'\2\v\0006\3\f\0'\5\r\0'\6\14\0'\a\15\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\17\0'\a\18\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\19\0'\a\20\0\18\b\2\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\21\0'\a\22\0\18\b\2\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\23\0'\a\24\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\25\0'\a\26\0\18\b\2\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\27\0'\a\28\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\29\0'\a\30\0\18\b\1\0'\t\16\0&\a\t\aB\3\4\0016\3\f\0'\5\r\0'\6\31\0'\a \0B\3\4\0016\3\f\0'\5\r\0'\6!\0'\a\"\0B\3\4\0016\3\f\0'\5\r\0'\6#\0'\a$\0B\3\4\0016\3\f\0'\5\r\0'\6%\0'\a&\0B\3\4\1K\0\1\0;<CMD>lua require('telescope.builtin').git_status()<CR>\15<leader>gs=<CMD>lua require('telescope.builtin').git_branches()<CR>\15<leader>gb<<CMD>lua require('telescope.builtin').git_commits()<CR>\15<leader>gc7<CMD>lua require('telescope.builtin').resume()<CR>\15<leader>ooC<CMD>lua require('telescope.builtin').oldfiles({cwd_only=true,\15<leader>olG<CMD>lua require('telescope.builtin').buffers({sort_lastused=true,\14<leader>b�\1<CMD>lua require('telescope.builtin').grep_string({additional_args=function(options) return {'--hidden', '--no-ignore'} end,\agO8<CMD>lua require('telescope.builtin').grep_string({\ago�\1<CMD>lua require('telescope.builtin').live_grep({additional_args=function(options) return {'--hidden', '--no-ignore', '-F'} end,\15<leader>aAv<CMD>lua require('telescope.builtin').live_grep({additional_args=function(options) return {'--hidden', '-F'} end,\15<leader>aaC<CMD>lua require('telescope.builtin').find_files({hidden=true,\15<leader>ff\v})<CR>6<CMD>lua require('telescope.builtin').git_files({\15<leader>gf\6n\bmapWlayout_strategy='vertical',layout_config={width=0.9, height=0.9, preview_cutoff=0}hlayout_strategy='horizontal',layout_config={width=0.9, height=0.9, mirror=false, preview_width=0.4}\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\t\0\0146\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\1K\0\1\0\28<cmd>GitBlameToggle<cr>\15<leader>gm\6n\bmap0<author> • <sha> • <date> • <summary>\30gitblame_message_template\21gitblame_enabled\6g\bvim\0", "config", "git-blame.nvim")
time([[Config for git-blame.nvim]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\2\n\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 �\1\0\1\a\0\6\0\t6\1\0\0009\1\1\1'\3\2\0\18\4\0\0005\5\4\0009\6\3\0=\6\5\5B\1\4\2L\1\2\0\17default_blue\1\0\b\bred\f#fc5d7c\tblue\f#78dce8\18file_modified\f#d59a27\17file_default\f#6a9e6b\tgrey\f#c0c0c0\vyellow\f#e5c463\abg\f#49464e\ngreen\f#9ecd6f\tblue\nforce\15tbl_extend\bvim�\3\0\0\f\0\26\0A'\0\0\0006\1\1\0009\1\2\0019\1\3\1\15\0\1\0X\2\1�'\0\4\0'\1\5\0006\2\1\0009\2\2\0029\2\6\2\15\0\2\0X\3\1�'\1\a\0006\2\1\0009\2\b\0029\2\t\0026\4\1\0009\4\b\0049\4\n\4'\6\v\0B\4\2\2'\5\f\0B\2\3\0026\3\1\0009\3\b\0039\3\n\3'\5\r\0B\3\2\0026\4\1\0009\4\b\0049\4\n\4'\6\14\0B\4\2\0026\5\15\0'\a\16\0B\5\2\0029\5\17\5\18\a\3\0\18\b\4\0B\5\3\0036\a\18\0'\t\19\0005\n\20\0\f\v\6\0X\v\1�'\v\21\0=\v\22\nB\a\3\0014\a\4\0005\b\23\0>\5\1\b>\b\1\a5\b\24\0>\b\2\a4\b\3\0\18\t\0\0\18\n\2\0&\t\n\t>\t\1\b5\t\25\0>\1\1\t>\t\2\b>\b\3\aL\a\2\0\1\3\0\0\0\abg\1\2\0\0\6 \1\3\0\0\0\16WL_icon_tmp\nguifg\nwhite\1\0\1\nguibg\f#49464e\16WL_icon_tmp\ahi\19get_icon_color\22nvim-web-devicons\frequire\b%:e\b%:t\t:~:.\6%\vexpand\16fnamemodify\afn\18file_modified\rmodified\17file_default\n🔒 \rreadonly\abo\bvim\5�\3\0\1\6\1\16\0002-\1\0\0009\1\0\1\18\3\0\0B\1\2\2\14\0\1\0X\1\2�'\1\1\0L\1\2\0004\1\6\0004\2\3\0-\3\0\0009\3\2\0035\5\3\0B\3\2\2>\3\1\0025\3\4\0>\3\2\2>\2\1\0015\2\5\0005\3\6\0>\3\2\2>\2\2\0014\2\3\0-\3\0\0009\3\a\0035\5\b\0B\3\2\2>\3\1\0025\3\t\0>\3\2\2>\2\3\0014\2\3\0-\3\0\0009\3\n\0035\5\v\0B\3\2\2>\3\1\0025\3\f\0>\3\2\2>\2\4\0014\2\3\0-\3\0\0009\3\r\0035\5\14\0B\3\2\2>\3\1\0025\3\15\0>\3\2\2>\2\5\1L\1\2\0\3�\1\3\0\0\tblue\abg\1\0\2\vformat\v 柳%s\14show_zero\2\17diff_changed\1\3\0\0\bred\abg\1\0\2\vformat\f  %s\14show_zero\2\17diff_removed\1\3\0\0\ngreen\abg\1\0\2\vformat\f  %s\14show_zero\2\15diff_added\1\3\0\0\ngreen\abg\1\2\0\0\n with\1\3\0\0\bred\abg\1\0\1\ticon\n  \15git_branch\5\vis_git�\2\0\1\6\1\v\0%-\1\0\0009\1\0\1\18\3\0\0B\1\2\2\14\0\1\0X\1\2�5\1\1\0L\1\2\0004\1\4\0004\2\3\0-\3\0\0009\3\2\0035\5\3\0B\3\2\2>\3\1\0025\3\4\0>\3\2\2>\2\1\0014\2\3\0-\3\0\0009\3\5\0035\5\6\0B\3\2\2>\3\1\0025\3\a\0>\3\2\2>\2\2\0014\2\3\0-\3\0\0009\3\b\0035\5\t\0B\3\2\2>\3\1\0025\3\n\0>\3\2\2>\2\3\1L\1\2\0\2�\1\3\0\0\17default_blue\abg\1\0\2\vformat\f  %s\14show_zero\2\rlsp_hint\1\3\0\0\vyellow\abg\1\0\2\vformat\f  %s\14show_zero\2\16lsp_warning\1\3\0\0\bred\abg\1\0\2\vformat\f  %s\14show_zero\2\14lsp_error\1\2\0\0\5\14check_lsp�\4\1\0\14\0\31\0=6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0024\4\3\0003\5\5\0>\5\1\0044\5\3\0009\6\6\1>\6\1\0059\6\a\0005\b\t\0003\t\b\0=\t\n\b4\t\3\0005\n\f\0005\v\v\0=\v\r\n4\v\6\0005\f\14\0003\r\15\0=\r\16\f>\f\1\v5\f\17\0003\r\18\0=\r\16\f>\f\2\v>\5\3\v5\f\19\0003\r\20\0=\r\16\f>\f\4\v>\4\5\v=\v\21\n4\v\0\0=\v\22\n>\n\1\t=\t\23\bB\6\2\0016\6\0\0'\b\24\0B\6\2\0029\6\a\0065\b\25\0005\t\26\0=\t\27\b5\t\28\0=\t\29\b4\t\0\0=\t\30\bB\6\2\0012\0\0�K\0\1\0\28floating_show_filetypes\19skip_filetypes\1\3\0\0\rNvimTree\blir\aui\1\0\2\16active_char\6-\17active_color\tblue\1\0\1\rinterval\3�\2\16wlfloatline\16statuslines\rinactive\vactive\0\1\0\1\tname\15diagnostic\0\1\0\1\tname\bgit\ttext\0\1\0\1\tname\tfile\14filetypes\1\0\0\1\2\0\0\fdefault\16colors_name\1\0\0\0\nsetup\fdivider\0\28windline.components.git\28windline.components.lsp\30windline.components.basic\rwindline\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nx\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\15auto_close\2\tmode\25document_diagnostics\25use_diagnostic_signs\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\frainbow\vcolors\1\b\0\0\f#bf616a\f#d08770\f#ebcb8b\f#a3be8c\f#88c0d0\f#5e81ac\f#b48ead\1\0\3\19max_file_lines\3�\a\venable\2\18extended_mode\2\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\vindent\venable\1\0\0\1\2\0\0\20javascriptreact\21ensure_installed\1\0\0\1\v\0\0\15javascript\thtml\bcss\truby\tjson\fclojure\tbash\blua\verlang\velixir\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3�\a\nsigns\1\0\5\22use_internal_diff\2\23use_decoration_api\2\20update_debounce\3d\nnumhl\2\18sign_priority\3\6\17changedelete\1\0\3\nnumhl\5\ahl\20GitGutterDelete\ttext\b│\14topdelete\1\0\3\nnumhl\5\ahl\20GitGutterDelete\ttext\b│\vdelete\1\0\3\nnumhl\5\ahl\20GitGutterDelete\ttext\b│\vchange\1\0\3\nnumhl\5\ahl\20GitGutterChange\ttext\b│\badd\1\0\0\1\0\3\nnumhl\5\ahl\17GitGutterAdd\ttext\b│\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\f\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0004\3\3\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\0049\4\6\0045\6\a\0B\4\2\2>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\t\4>\4\2\3=\3\v\2B\0\2\1K\0\1\0\fsources\1\0\0\14prettierd\15formatting\1\0\1\ftimeout\3�N\twith\reslint_d\16diagnostics\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: vim-bbye
time([[Config for vim-bbye]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27cnoreabbrev bd Bdelete\bcmd\bvim\0", "config", "vim-bbye")
time([[Config for vim-bbye]], false)
-- Config for: obvious-resize
time([[Config for obvious-resize]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\14\0\0296\0\0\0009\0\1\0)\1\4\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\5\0'\3\b\0'\4\t\0B\0\4\0016\0\4\0'\2\5\0'\3\n\0'\4\v\0B\0\4\0016\0\4\0'\2\5\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0\28:ObviousResizeRight<cr>\14<c-right>\27:ObviousResizeLeft<cr>\r<c-left>\27:ObviousResizeDown<cr>\r<c-down>\25:ObviousResizeUp<cr>\v<c-up>\5\bmap\28obvious_resize_run_tmux\27obvious_resize_default\6g\bvim\0", "config", "obvious-resize")
time([[Config for obvious-resize]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\n\0\25\0<6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0)\1\0\1=\1\4\0006\0\0\0009\0\3\0)\1\1\0=\1\5\0006\0\0\0009\0\3\0)\1\1\0=\1\6\0006\0\0\0009\0\3\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0'\2\v\0B\0\2\0016\0\0\0009\0\n\0'\2\f\0B\0\2\0016\0\r\0'\2\14\0005\3\15\0B\0\3\0015\0\16\0006\1\17\0\18\3\0\0B\1\2\4X\4\4�6\6\r\0\18\b\5\0005\t\18\0B\6\3\1E\4\3\3R\4�6\1\r\0'\3\19\0005\4\20\0B\1\3\0016\1\r\0'\3\21\0005\4\22\0B\1\3\0016\1\r\0'\3\23\0005\4\24\0B\1\3\1K\0\1\0\1\0\1\nguifg\f#6a9e6b\23NvimTreeOpenedFile\1\0\1\nguifg\f#d59a27\22NvimTreeFileDirty\1\0\1\nguifg\f#979922\20NvimTreeFileNew\1\0\1\nguifg\f#d4c5a2\vipairs\1\f\0\0\29NvimTreeOpenedFolderName\23NvimTreeFolderName\20NvimTreeSymlink\23NvimTreeRootFolder\23NvimTreeFolderIcon\28NvimTreeEmptyFolderName\21NvimTreeExecFile\24NvimTreeSpecialFile\22NvimTreeImageFile\25NvimTreeMarkdownFile\25NvimTreeIndentMarker\1\0\1\nguibg\tnone\16NormalFloat\ahi\26 hi clear SignColumn \26 colorscheme gruvbox \bcmd\tdark\15background\17gruvbox_bold\30gruvbox_italicize_strings\19gruvbox_italic\15termcolors\6g\18termguicolors\6o\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0 \0%6\0\0\0'\2\1\0'\3\2\0'\4\3\0005\5\4\0B\0\5\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\0025\3\19\0005\4\20\0=\4\21\0035\4\23\0005\5\22\0=\5\24\0045\5\25\0005\6\26\0=\6\f\0055\6\27\0=\6\28\5=\5\29\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\rrenderer\nicons\vglyphs\vfolder\1\0\4\topen\b\17arrow_closed\b\15arrow_open\b\fdefault\b\1\0\5\14untracked\5\frenamed\5\runmerged\5\vstaged\5\runstaged\5\1\0\2\fsymlink\b\fdefault\b\tshow\1\0\0\1\0\4\17folder_arrow\2\bgit\2\tfile\2\vfolder\2\19indent_markers\1\0\1\venable\2\1\0\2\27highlight_opened_files\tname\18highlight_git\2\factions\14open_file\1\0\0\1\0\1\17quit_on_open\2\tview\1\0\2\tside\tleft\nwidth\3#\bgit\1\0\1\vignore\1\24update_focused_file\1\0\0\1\0\1\venable\2\nsetup\14nvim-tree\frequire\1\0\1\fnoremap\2\24:NvimTreeToggle<cr>\21<leader><leader>\6n\bmap\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-bufonly
time([[Config for vim-bufonly]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25cnoreabbrev bo Bonly\bcmd\bvim\0", "config", "vim-bufonly")
time([[Config for vim-bufonly]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1�\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0", "config", "FixCursorHold.nvim")
time([[Config for FixCursorHold.nvim]], false)
-- Config for: shade.nvim
time([[Config for shade.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\tkeys\1\0\2\17opacity_step\3\1\20overlay_opacity\0032\nsetup\nshade\frequire\0", "config", "shade.nvim")
time([[Config for shade.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\4\0\20\0)6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\f\0'\1\14\0=\1\r\0006\0\15\0'\2\16\0B\0\2\0029\0\17\0005\2\18\0004\3\0\0=\3\19\2B\0\2\1K\0\1\0\24char_highlight_list\1\0\0\nsetup\21indent_blankline\frequire\n99999\16colorcolumn\awo\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\5\0\0\thelp\rterminal\nalpha\rNvimTree&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent$indent_blankline_use_treesitter\b▏\26indent_blankline_char\23indentLine_enabled\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0'\3\6\0'\4\a\0B\0\4\0016\0\4\0'\2\5\0'\3\b\0'\4\t\0B\0\4\0016\0\4\0'\2\5\0'\3\n\0'\4\v\0B\0\4\0016\0\4\0'\2\5\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\5\bmap\1\0\2\14auto_save\fcurrent\20disable_on_zoom\1\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: nvim-lsputils
time([[Config for nvim-lsputils]], true)
try_loadstring("\27LJ\2\n�\5\0\0\4\0\23\0A6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0", "config", "nvim-lsputils")
time([[Config for nvim-lsputils]], false)
-- Config for: vim-dotenv
time([[Config for vim-dotenv]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\4\0'\3\5\0'\4\6\0B\0\4\1K\0\1\0\16Dotenv .env\t.env\17BufWritePost2if !empty(glob('.env')) | Dotenv .env | endif\6*\rVimEnter\aau\0", "config", "vim-dotenv")
time([[Config for vim-dotenv]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\a\2\0266\0\0\0009\0\1\0'\2\2\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17�6\1\0\0009\1\3\1'\3\2\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2\v\1\0\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\2\0]\0\2\n\0\4\0\0186\2\0\0009\2\1\2\18\4\0\0B\2\2\2!\2\2\1'\3\2\0)\4\1\0\18\5\2\0)\6\1\0M\4\4�\18\b\3\0'\t\3\0&\3\t\bO\4�\18\4\0\0\18\5\3\0&\4\5\4L\4\2\0\6 \5\blen\vstring;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\1\0\2\b\2\a\0\0225\2\0\0009\3\1\0009\3\2\0038\3\3\2\v\3\0\0X\4\2�=\3\3\1X\4\a�-\4\0\0009\6\4\1)\a\b\0B\4\3\2\18\5\3\0&\4\5\4=\4\3\1-\4\1\0009\4\5\0049\6\4\0015\a\6\0B\4\3\2=\4\4\1L\1\2\0\5�\3�\1\0\1\14with_text\1\rsymbolic\tkind\tmenu\tname\vsource\1\0\6\rnvim_lua\n|api|\15fuzzy_path\v|fpth|\17fuzzy_buffer\v|fbuf|\rnvim_lsp\n|lsp|\vbuffer\n|buf|\tpath\n|pth|�\1\0\1\t\1\n\1 6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\14�6\1\0\0009\1\1\0019\1\3\0016\3\0\0009\3\4\0039\3\5\3'\5\6\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\a\0B\1\3\1X\1\v�-\1\0\0009\1\b\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\t\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_next_item\fvisible\5!<Plug>(vsnip-expand-or-jump)\27nvim_replace_termcodes\bapi\rfeedkeys\20vsnip#available\afn\bvim\2�\1\0\1\t\1\n\1 6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\14�6\1\0\0009\1\1\0019\1\3\0016\3\0\0009\3\4\0039\3\5\3'\5\6\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\a\0B\1\3\1X\1\v�-\1\0\0009\1\b\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\t\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_next_item\fvisible\5\28<Plug>(vsnip-jump-prev)\27nvim_replace_termcodes\bapi\rfeedkeys\20vsnip#available\afn\bvim\2�\v\1\0\16\0M\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0023\4\5\0003\5\6\0009\6\a\0005\b\t\0005\t\b\0=\t\n\b5\t\v\0=\t\f\b5\t\14\0003\n\r\0=\n\15\t=\t\16\b5\t\18\0005\n\17\0=\n\19\t3\n\20\0=\n\21\t=\t\22\b4\t\5\0005\n\23\0>\n\1\t5\n\24\0>\n\2\t5\n\25\0>\n\3\t5\n\26\0>\n\4\t=\t\27\b5\t\31\0009\n\28\0009\f\28\0009\f\29\fB\f\1\0025\r\30\0B\n\3\2=\n \t9\n\28\0009\n!\n)\f��B\n\2\2=\n\"\t9\n\28\0009\n!\n)\f\4\0B\n\2\2=\n#\t9\n\28\0009\f\28\0009\f$\f5\14'\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r)\0B\n\3\2=\n*\t9\n\28\0009\f\28\0009\f+\f5\14,\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r-\0B\n\3\2=\n.\t9\n\28\0009\f\28\0009\f$\f5\14/\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r0\0B\n\3\2=\n1\t9\n\28\0009\f\28\0009\f+\f5\0142\0009\15%\0009\15&\15=\15(\14B\f\2\0025\r3\0B\n\3\2=\n4\t9\n\28\0009\f\28\0009\f5\f5\0147\0009\0156\0009\15&\15=\15(\14B\f\2\0025\r8\0B\n\3\2=\n9\t9\n\28\0003\f:\0005\r;\0B\n\3\2=\n<\t9\n\28\0003\f=\0005\r>\0B\n\3\2=\n?\t=\t\28\bB\6\2\0016\6@\0'\bA\0'\tB\0'\nC\0'\vD\0'\fE\0'\rF\0&\n\r\nB\6\4\0016\6@\0'\bA\0'\tG\0'\nH\0'\vI\0'\fJ\0'\rK\0'\14L\0&\n\14\nB\6\4\0012\0\0�K\0\1\0\t } }+{ name = 'look', max_item_count = 10 }-{ name = 'emoji', max_item_count = 20 },-{ name = 'spell', max_item_count = 10 },1lua require'cmp'.setup.buffer { sources = { \23gitcommit,markdown\b}})/{ name = \"nvim_lsp\", max_item_count = 20 }\27{ name = \"nvim_lua\" },0lua require\"cmp\".setup.buffer({ sources = {\blua\rfiletype\aau\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\3\0\0\6i\6s\1\0\1\vselect\2\20ConfirmBehavior\fconfirm\t<Up>\1\3\0\0\6i\6s\1\0\0\v<Down>\1\3\0\0\6i\6s\1\0\0\n<C-p>\1\3\0\0\6i\6s\1\0\0\21select_prev_item\n<C-n>\1\3\0\0\6i\6s\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\n<C-f>\n<C-d>\16scroll_docs\14<C-Space>\1\0\0\1\3\0\0\6i\6c\rcomplete\fmapping\fsources\1\0\1\tname\nvsnip\1\0\2\tname\tpath\rpriority\3\1\1\0\2\tname\vbuffer\19max_item_count\3\n\1\0\2\tname\rnvim_lsp\19max_item_count\3\n\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\fsnippet\vexpand\1\0\0\0\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15completion\1\0\0\1\0\1\16completeopt#menu,menuone,noinsert,noselect\nsetup\0\0\flspkind\23cmp.config.compare\14cmp.types\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0'\2\r\0'\3\14\0'\4\15\0B\0\4\0016\0\f\0'\2\r\0'\3\16\0'\4\17\0B\0\4\1K\0\1\0\29:BufferLineCyclePrev<cr>\14<leader>p\29:BufferLineCycleNext<cr>\14<leader>n\6n\bmap\15highlights\tfill\1\0\0\1\0\1\nguibg\f#1e1e1e\foptions\1\0\0\foffsets\1\0\n\24show_tab_indicators\2\rtab_size\3\25\22max_prefix_length\3\0\20max_name_length\3#\20show_close_icon\1\18modified_icon\b\22buffer_close_icon\b\20separator_style\tthin\28show_buffer_close_icons\2\25enforce_regular_tabs\1\1\0\3\fpadding\3\1\rfiletype\rNvimTree\ttext\5\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Replace lua require("packer.load")({'nvim-spectre'}, { cmd = "Replace", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
