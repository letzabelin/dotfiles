-- Configuration folder
local configuration_folder               = vim.fn.expand('~') .. '/.config/nvim/'
local set_global                         = vim.o
local set_buffer                         = vim.bo
local set_window                         = vim.wo

-- General
vim.cmd [[ filetype plugin indent on ]]

do local number                          = true                          -- Numbers on left side
  set_global.number                      = number
  set_window.number                      = number
end

do local relativenumber                  = true                          -- Show the line number relative to the line with the cursor in front of each line.
  set_global.relativenumber              = relativenumber
  set_window.relativenumber              = relativenumber
end

set_global.encoding                      = "utf-8"                       -- Use UTF-8 encoding
set_global.fileencoding                  = "utf-8"                       -- Use UTF-8 encoding
set_global.langmenu                      = "en_US.UTF-8"                 -- Use UTF-8 encoding
set_global.backup                        = false                         -- Don't backup
set_global.writebackup                   = false                         -- Write file inplace

do local swapfile                        = false                         -- Don't use swap files
  set_global.swapfile                    = swapfile
  set_buffer.swapfile                    = swapfile
end

set_global.autoread                      = true                          -- Autoreload buffers
set_global.autowrite                     = true                          -- Automatically save changes before switching buffers
set_global.showmode                      = false                         -- Doesnt show vim mode
set_global.termguicolors                 = true                          -- Better colors

vim.cmd [[ syntax enable ]]                                              -- Enable syntax highlight
vim.cmd [[ syntax on ]]                                                  -- Syntax on for wimwiki

-- History, Cursor, rules
set_global.history                       = 50                            -- Just remeber last 50 commands
set_global.laststatus                    = 2                             -- Always display status line
set_global.ruler                         = true                          -- Show the cursor position all the time
set_global.showcmd                       = false                         -- Don't display incomplete commands
do local cursorline                      = true                          -- Highlight current cursor line
  set_global.cursorline                  = cursorline
  set_window.cursorline                  = cursorline
end
set_global.shell                         = '/bin/zsh'                    -- Default shell
set_global.completeopt                   = 'menuone,noinsert,noselect'   -- Better completion experience

-- Tabs and whitespace
do local wrap                            = true                          -- Wrap lines
  set_global.wrap                        = true
  set_window.wrap                        = true
end

do local tabstop                         = 2                             -- Tabs are always 2 spaces
  set_global.tabstop                     = tabstop
  set_buffer.tabstop                     = tabstop
end

do local autoindent                      = true                          -- Copy indent from current line when starting a new line
  set_global.autoindent                  = autoindent
  set_buffer.autoindent                  = autoindent
end


do local softtabstop                     = 2                             -- Number of spaces that a <Tab> counts for while performing editing operations
  set_global.softtabstop                 = softtabstop
  set_buffer.softtabstop                 = softtabstop
end

do local expandtab                       = true                          -- Expand tabs into spaces
  set_global.expandtab                   = expandtab
  set_buffer.expandtab                   = expandtab
end

do local shiftwidth                      = vim.o.tabstop                 -- Reindent with 2 spaces (using <<)
  set_global.shiftwidth                  = shiftwidth
  set_buffer.shiftwidth                  = shiftwidth
end

do local list                            = true                          -- Show invisible chars
  set_global.list                        = true
  set_window.list                        = true
end

set_global.showbreak                     = '↪ '                          -- Set breakline char
do local smartindent                     = true                          -- Autoindenting when starting a new line
  set_global.smartindent                 = smartindent
  set_buffer.smartindent                 = smartindent
end
set_global.smarttab                      = true                          -- <Tab> in front of a line inserts blanks according to 'shiftwidth'
set_global.listchars                     = ""                            -- Reset listchars
set_global.listchars                     = 'tab:»»,trail:·,space:·'      -- Custom listchars

-- Search
set_global.hlsearch                      = true                          -- Highlight matches
set_global.incsearch                     = true                          -- Incremental searching
set_global.ignorecase                    = true                          -- Searches are case insensitive...
set_global.smartcase                     = true                          -- ... unless they contain at least one capital letter
set_global.inccommand                    = 'nosplit'                     -- live substitute

-- Enable hotkeys for Russian layout
set_global.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
set_global.mouse                         = 'a'                           -- Mouse support

-- Don't redraw while executing macros (good performance config)
set_global.lazyredraw                    = true                          -- The screen will not be redrawn while executing macros, registers and other commands that have not been typed
set_global.hidden                        = true                          -- TextEdit might fail if hidden is not set
set_global.foldenable                    = false                         -- All folds are open
set_global.wb                            = false                         -- Don't make a backup before overwriting a file
set_global.splitbelow                    = true                          -- Splitting a window will put the new window below the current one
set_global.scrolloff                     = 3                             -- Minimal number of screen lines to keep above and below the cursor
set_global.cmdheight                     = 2                             -- Give more space for displaying messages

do local linebreak                       = true                          -- Wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen
  set_global.linebreak                   = linebreak
  set_window.linebreak                   = linebreak
end

-- ############# Persistent Undo #############
-- Keep undo history across sessions, by storing in file
-- Only works all the time
set_global.undodir                       = configuration_folder .. "undodir.vim"
do local undofile                        = true
  set_global.undofile                    = undofile
  set_buffer.undofile                    = undofile
end

-- write path when save file if needed
vim.cmd("autocmd BufNewFile * :exe ': !mkdir -p ' . escape(fnamemodify(bufname('%'),':p:h'),'#% \\')")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience
set_global.updatetime                    = 100

-- Don't pass messages to |ins-completion-menu|.
set_global.shortmess                     = vim.o.shortmess .. 'c'

-- Never show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved
do local signcolumn                      = 'no'
  set_global.signcolumn                  = signcolumn
  set_window.signcolumn                  = signcolumn
end
