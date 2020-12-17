return function()
  vim.g.lua_tree_side = 'left'
  vim.g.lua_tree_width = 30
  vim.g.lua_tree_auto_close = 1
  vim.g.lua_tree_quit_on_open = 1
  vim.g.lua_tree_follow = 1
  vim.g.lua_tree_indent_markers = 1
  vim.g.lua_tree_git_hl = 1
  vim.g.lua_tree_allow_resize = 1

  vim.g.lua_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }

  vim.g.lua_tree_icons = {
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

  vim.api.nvim_set_keymap('n', '<leader><leader>', ':LuaTreeToggle<CR>', { noremap = true })
end
