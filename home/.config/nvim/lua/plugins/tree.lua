return function()
  local map = require('utils').map
  local global = vim.g

  global.lua_tree_side = 'left'
  global.lua_tree_width = 30
  global.lua_tree_auto_close = 1
  global.lua_tree_quit_on_open = 1
  global.lua_tree_follow = 1
  global.lua_tree_indent_markers = 1
  global.lua_tree_git_hl = 1
  global.lua_tree_allow_resize = 1

  global.lua_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }

  global.lua_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★"
    },
    folder = {
      default = "",
      open = ""
    }
  }

  map('n', '<leader><leader>', ':LuaTreeToggle<CR>', { noremap = true })
end
