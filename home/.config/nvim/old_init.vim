if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ############# General #############
Plug 'tpope/vim-commentary'                                        " Fast comment/uncomment lines, gcc
Plug 'tpope/vim-fugitive'                                          " :Git diff | :Git commit | :Git add | :GStatus
Plug 'tpope/vim-git'                                               " Syntax, indent, and filetype plugin files for git, gitconfig etc.
Plug 'tpope/vim-surround'                                          " Surrounding parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-repeat'                                            " Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-unimpaired'                                        " Additional mappings, [<space> - add new line before cursor, [b - prev buffer and ]b - next buffer
Plug 'cohama/lexima.vim'                                           " Auto close parentheses and repeat by .
Plug 'terryma/vim-multiple-cursors'                                " Multiple Cursors like in IDE
Plug 'tpope/vim-sensible'                                          " Default additional configs
Plug 'janko-m/vim-test'                                            " Testing with hotkeys
Plug 'dyng/ctrlsf.vim'                                             " Searching in file
Plug 'AndrewRadev/switch.vim'                                      " Add switch toggles, -
Plug 'matze/vim-move'                                              " Move lines or symbols, Alt-j
Plug 'AndrewRadev/splitjoin.vim'                                   " Split or join lines, gS, gJ
Plug 'tpope/vim-abolish'                                           " Abbreviations
Plug 'nathanaelkane/vim-indent-guides'                             " Highlight indent lines

" ############# DATABASES #############
Plug 'tpope/vim-dadbod'                                            " Database for vim
Plug 'kristijanhusak/vim-dadbod-ui'                                " Interactive db in buffer

" ############# Theme #############
" Plug 'rakr/vim-one'                                                " Color theme
" Plug 'equt/paper.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'                                       " Status line

" ############# Search and navigation #############
Plug 'easymotion/vim-easymotion'                                   " Fast navigation with <leader>s +letter
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Search by project 
Plug 'junegunn/fzf.vim'                                            " Search
Plug 'pechorin/any-jump.vim'                                       " Jump to definitions & etc
Plug 'chaoren/vim-wordmotion'                                      " More useful word motions <leader>w|b|e
Plug 'farmergreg/vim-lastplace'                                    " Reopen files at your last edit position

" ############# DevOps #############
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }              " Highlight and commands for terraform
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }            " Highlight Dockerfile
Plug 'chr4/nginx.vim'                                              " Syntax highlight nginx files

" ############# JSON | Markdown | Yaml #############
Plug 'elzr/vim-json'                                               " Highlighting of keywords vs values, JSON-specific
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }              " Syntax highlighting, matching rules etc. for Markdown
Plug 'shime/vim-livedown', { 'for': 'markdown' }                   " Vim Livedown plugin (need livedown from npm)
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }                         " Highlight YAML

" ############# Templates #############
Plug 'tpope/vim-ragtag'                                            " Support differnt tags like <%= %>
Plug 'othree/html5.vim'                                            " HTML5 + inline SVG omnicomplete function, indent and syntax
Plug 'AndrewRadev/tagalong.vim'                                    " Rename tags
Plug 'slim-template/vim-slim', { 'for': ['slim', 'slime'] }        " slim syntax highlighting for vim
Plug 'tpope/vim-haml', { 'for': 'haml' }                           " haml syntax highlighting for vim
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }                       " pug syntax highlighting for vim 

" ############# Javascript && Typescript #############
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }            " Syntax highlighting and indent for javascript
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }           " Syntax highlighting and indent for jsx, ts, tsx

" ############# Kotlin #############
Plug 'udalov/kotlin-vim'

" ############# HTML && CSS #############
Plug 'mattn/emmet-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" ############# Ruby #############
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tabnine',
      \ 'coc-explorer',
      \ 'coc-cspell-dicts',
      \ 'coc-spell-checker',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-stylelint',
      \ 'coc-vimlsp',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-jest',
      \ 'coc-solargraph',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-diagnostic',
      \ 'coc-git',
      \ 'coc-prettier'
      \]

call plug#end()

" General
set nocompatible                                                    " Vim behavior, not Vi
scriptencoding utf-8                                                " Use UTF-8 encoding
set encoding=utf8                                                   " Use UTF-8 encoding
set fileencoding=utf-8                                              " Use UTF-8 encoding
set langmenu=en_US.UTF-8                                            " Use UTF-8 encoding
set encoding=utf-8                                                  " Use UTF-8 encoding
set nobackup                                                        " Don't backup
set nowritebackup                                                   " Write file inplace
set noswapfile                                                      " Don't use swap files
set autoread                                                        " Autoreload buffers
set autowrite                                                       " Automatically save changes before switching buffers
set noshowmode                                                      " Doesnt show vim mode
syntax enable                                                       " Enable syntax highlight
syntax on                                                           " Syntax on for wimwiki
set termguicolors                                                   " Better colors

inoremap jk <ESC>
let mapleader="\<Space>"                                            " <Leader> key

" Themes
colorscheme jellybeans
" colorscheme one
set background=dark

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['filename', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['gitbranch'], ['readonly'], ['cocstatus'], ['currentfunction']]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'StatusDiagnostic',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" History, Cursor, rules
set history=50                                                      " Just remeber last 50 commands
set laststatus=2                                                    " Always display status line
set ruler                                                           " Show the cursor position all the time
set number relativenumber                                           " Show line numbers 
set showcmd                                                         " Display incomplete commands
set cursorline                                                      " Highlight current cursor line
set shell=$SHELL                                                    " Default shell

" Tabs and whitespace
set wrap                                                            " Wrap lines
set tabstop=2                                                       " Tabs are always 2 spaces
set autoindent
set smartindent
set softtabstop=2
set smarttab
set expandtab                                                       " Expand tabs into spaces
set shiftwidth=2                                                    " Reindent with 2 spaces (using <<)
set showbreak=↪\                                                    " Set breakline char
set list                                                            " Show invisible chars
set listchars=""                                                    " Reset listchars
set list listchars=tab:»·,trail:·,space:·                           " Set listchars for tabs and trailing spaces

" Search
set hlsearch                                                        " Highlight matches
set incsearch                                                       " Incremental searching
set ignorecase                                                      " Searches are case insensitive...
set smartcase                                                       " ... unless they contain at least one capital letter
set inccommand=nosplit                                              " live substitute

" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Mouse
if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set ttyfast
set lazyredraw
set hidden
set nofoldenable
set linebreak
set nowb
set splitbelow
set scrolloff=3

filetype plugin indent on

" Databases
let g:dbs = {
      \  'dev': 'postgres://andrew:1234@localhost:5432/learning_ruby_development'
      \ }

let g:db_ui_auto_execute_table_helpers = 1

" ############# Persistent Undo #############
" Keep undo history across sessions, by storing in file.
" Only works all the time
if has('persistent_undo')
  silent !mkdir /tmp/.vim/backups > /dev/null 2>&1
  set undodir=/tmp/.vim/backups
  set undofile
endif

" Keymaps
nmap <leader><leader> :CocCommand explorer --preset default<CR>
let g:coc_explorer_global_presets = {
      \   'default': {
      \     'file.child.template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1][readonly] [linkIcon & 1][link growRight 1 omitCenter 5][size]'
      \   }
      \ }

map <Leader> <Plug>(easymotion-prefix)

" Move between vim-tabs
nmap <a-m> :tabNext<CR>

" Wordmotion
let g:wordmotion_prefix = ','

function! InitAbbreviations()
  Abolish! -cmdline co{snt,tsn,tns,nts} co{nst}
  Abolish! -cmdline ret{utn,nurn} ret{urn}
  Abolish! -cmdline aw{ati,tai,tia} aw{ait}
  Abolish! -cmdline len{ght} len{gth}
  Abolish! -cmdline tr{eu} tr{ue}
  Abolish! -cmdline fun{citon} fun{ction}
endfunction
autocmd VimEnter * call InitAbbreviations()

""" Basics Keymaps
" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nmap j gj
nmap k gk

" scroll page horizontally centres
nmap <C-u> <C-u>zz
nmap <C-d> <C-d>zz

" do Y to yank till the end of the line
nmap Y y$

" Switch key toggles
let g:switch_mapping = "-"

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Testing with vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" For scrolling in test
tmap <C-o> <C-\><C-n>

" Jest config
let g:test#javascript#runner = "jest"
let g:test#javascript#jest#executable = 'npx -n --experimental-vm-modules -n --no-warnings jest --colors'

" Search in files with ctrlsf
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" format the entire file
nnoremap ff :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" nohlsearch
nmap <silent> // :nohlsearch<CR>
noremap <leader>hl :set hlsearch! hlsearch?<CR>

" Copy to system clipboard
vmap <leader><C-c> "+y
" Paste from system clipboard
nmap <leader><C-v> "+p
vmap <leader><C-v> "+p

" FZF {
nnoremap <leader>b :Buffers<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>aa :Ag<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>gs :Gstatus<CR>

" Window or Popup
" let g:fzf_layout = { 'down': '40%' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }

"Correct indent in tags
augroup indent
  autocmd FileType html imap <c-k><c-j> <CR><Esc>O
  autocmd FileType eruby imap <c-k><c-j> <CR><Esc>O
augroup END
imap <c-k><c-j> <CR><Esc>O<Tab>

" js settings for emmet
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

augroup FileTypeTetect
  autocmd!
  " au BufEnter *.markdown,*.mkd,*.md setl wrap tw=79
  " au BufEnter *.json setl ft=javascript
  autocmd BufEnter Makefile setlocal ts=4 sw=4 noexpandtab

  " au BufEnter *.js setl ts=2 sw=2 sts=2
  " au BufEnter *.html setl ts=4 sw=4 sts=4
  " au BufEnter *.es6 setf javascript
augroup END

""" COC
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Never show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=no

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation with AnyJump
nmap go :AnyJump<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Match all words in project
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_snippet_next = '<tab>'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" copy/past between vim sessions
vmap <leader>y :w! /tmp/.vim/.vbuf<CR>
nmap <leader>y :.w! /tmp/.vim/.vbuf<CR>
nmap <leader>p :r /tmp/.vim/.vbuf<CR>

let g:indent_guides_start_level = 2
set ts=2 sw=2 et

let g:indent_guides_enable_on_vim_startup = 1
