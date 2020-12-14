-- Configuration folder
local configuration_folder = vim.fn.expand('~') .. '/.config/nvim/'

-- If have not vimp
if not pcall(require, 'vimp') then
  vim.cmd [[ echom 'Cannot load `vimp`' ]]
  return
end

-- General

-- Line numbers
do local number = true
  vim.o.number = number
  vim.wo.number = number
end

do local relativenumber = true
  vim.o.relativenumber = relativenumber
  vim.wo.relativenumber = relativenumber
end

vim.o.encoding                      = "utf8"                        -- Use UTF-8 encoding
vim.o.encoding                      = "utf-8"                       -- Use UTF-8 encoding
vim.o.fileencoding                  = "utf-8"                       -- Use UTF-8 encoding
vim.o.langmenu                      = "en_US.UTF-8"                 -- Use UTF-8 encoding
vim.o.backup                        = false                         -- Don't backup
vim.o.writebackup                   = false                         -- Write file inplace
vim.o.swapfile                      = false                         -- Don't use swap files
vim.o.autoread                      = true                          -- Autoreload buffers
vim.o.autowrite                     = true                          -- Automatically save changes before switching buffers
vim.o.showmode                      = false                         -- Doesnt show vim mode
vim.o.termguicolors                 = true                          -- Better colors
vim.cmd [[ syntax enable ]]                                         -- Enable syntax highlight
vim.cmd [[syntax on ]]                                              -- Syntax on for wimwiki
-- vim.cmd [[ scriptencoding utf-8 ]]                                  -- Use UTF-8 encoding

-- History, Cursor, rules
vim.o.history                       = 50                            -- Just remeber last 50 commands
vim.o.laststatus                    = 2                             -- Always display status line
vim.o.ruler                         = true                          -- Show the cursor position all the time
vim.o.showcmd                       = true                          -- Display incomplete commands
vim.o.cursorline                    = true                          -- Highlight current cursor line
vim.o.shell                         = '$SHELL'                      -- Default shell

-- Tabs and whitespace
do local wrap                       = true                          -- Wrap lines
  vim.o.wrap                        = true
  vim.wo.wrap                       = true
end
vim.o.tabstop                       = 2                             -- Tabs are always 2 spaces
vim.o.autoindent                    = true
vim.o.smartindent                   = true
vim.o.softtabstop                   = 2
vim.o.smarttab                      = true
vim.o.expandtab                     = true                          -- Expand tabs into spaces
vim.o.shiftwidth                    = 2                             -- Reindent with 2 spaces (using <<)
vim.o.showbreak                     = '↪ '                          -- Set breakline char
vim.o.list                          = true                          -- Show invisible chars
vim.o.listchars                     = ""                            -- Reset listchars
-- vim.o.listchars=tab:»·,trail:·,space:·                           -- Set listchars for tabs and trailing spaces
vim.o.listchars = 'tab:░░,trail:·,space:·,extends:»,precedes:«,nbsp:⣿'

-- Search
vim.o.hlsearch                      = true                          -- Highlight matches
vim.o.incsearch                     = true                          -- Incremental searching
vim.o.ignorecase                    = true                          -- Searches are case insensitive...
vim.o.smartcase                     = true                          -- ... unless they contain at least one capital letter
vim.o.inccommand                    = 'nosplit'                     -- live substitute

-- Enable hotkeys for Russian layout
vim.o.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
vim.o.mouse                         = 'a'                           -- Mouse support

-- Don't redraw while executing macros (good performance config)
vim.o.lazyredraw                    = true                          -- The screen will not be redrawn while executing macros, registers and other commands that have not been typed.
vim.o.hidden                        = true                          -- TextEdit might fail if hidden is not set.
vim.o.foldenable                    = false
vim.o.linebreak                     = true
vim.o.wb                            = false
vim.o.splitbelow                    = true
vim.o.scrolloff                     = 3
vim.o.cmdheight                     = 2                             -- Give more space for displaying messages.
vim.cmd [[ filetype plugin indent on ]]

-- ############# Persistent Undo #############
-- Keep undo history across sessions, by storing in file.
-- Only works all the time
vim.o.undodir = configuration_folder .. "undodir.vim"
do local undofile = true
  vim.o.undofile = undofile
  vim.bo.undofile = undofile
end

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime                     = 300

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess                      = vim.o.shortmess .. 's'

-- Never show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
do local signcolumn                  = 'no'
  vim.o.signcolumn                   = 'no'
  vim.wo.signcolumn                  = 'no'
end
