vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd('nmap <bs> <leader>')

if not package.loaded.lazy then require('lazynvim') end
require('autocommands')
require('commands')
require('settings')
require('lsp.settings')
