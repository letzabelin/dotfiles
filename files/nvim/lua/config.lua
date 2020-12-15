-- Configuration folder
local configuration_folder = vim.fn.expand('~') .. '/.config/nvim/'

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

vim.o.encoding                      = "utf-8"                       -- Use UTF-8 encoding
vim.o.fileencoding                  = "utf-8"                       -- Use UTF-8 encoding
vim.o.langmenu                      = "en_US.UTF-8"                 -- Use UTF-8 encoding
vim.o.backup                        = false                         -- Don't backup
vim.o.writebackup                   = false                         -- Write file inplace
do local swapfile                   = false                         -- Don't use swap files
  vim.o.swapfile                    = swapfile
  vim.bo.swapfile                   = swapfile
end
vim.o.autoread                      = true                          -- Autoreload buffers
vim.o.autowrite                     = true                          -- Automatically save changes before switching buffers
vim.o.showmode                      = false                         -- Doesnt show vim mode
vim.o.termguicolors                 = true                          -- Better colors
vim.cmd [[ syntax enable ]]                                         -- Enable syntax highlight
vim.cmd [[syntax on ]]                                              -- Syntax on for wimwiki
-- vim.execute(scriptencoding utf-8)                                  -- Use UTF-8 encoding

-- History, Cursor, rules
vim.o.history                       = 50                            -- Just remeber last 50 commands
vim.o.laststatus                    = 2                             -- Always display status line
vim.o.ruler                         = true                          -- Show the cursor position all the time
vim.o.showcmd                       = true                          -- Display incomplete commands
vim.o.cursorline                    = true                          -- Highlight current cursor line
vim.o.shell                         = '/bin/zsh'                    -- Default shell

-- Tabs and whitespace
do local wrap                       = true                          -- Wrap lines
  vim.o.wrap                        = true
  vim.wo.wrap                       = true
end
do local tabstop                    = 2                             -- Tabs are always 2 spaces
  vim.o.tabstop                     = tabstop
  vim.bo.tabstop                    = tabstop
end
do local autoindent                 = true
  vim.o.autoindent                  = autoindent
  vim.bo.autoindent                 = autoindent
end
vim.o.smartindent                   = true
do local softtabstop                = 2
  vim.o.softtabstop                 = softtabstop
  vim.bo.softtabstop                = softtabstop
end
vim.o.smarttab                      = true
do local expandtab                  = true                          -- Expand tabs into spaces
  vim.o.expandtab                   = expandtab
  vim.bo.expandtab                  = expandtab
end
do local shiftwidth                 = vim.o.tabstop                 -- Reindent with 2 spaces (using <<)
  vim.o.shiftwidth                  = shiftwidth
  vim.bo.shiftwidth                 = shiftwidth
end
vim.o.showbreak                     = '↪ '                          -- Set breakline char
do local list                       = true
  vim.o.list                        = true
  vim.wo.list                       = true                          -- Show invisible chars
end
vim.o.listchars                     = ""                            -- Reset listchars
vim.o.listchars                     = 'tab:»»,trail:·,space:·'

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
do local linebreak                  = true
  vim.o.linebreak                   = linebreak
  vim.wo.linebreak                  = linebreak
end
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
vim.o.updatetime                    = 300

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess                     = vim.o.shortmess .. 's'

-- Never show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
do local signcolumn                 = 'no'
  vim.o.signcolumn                  = 'no'
  vim.wo.signcolumn                 = 'no'
end
