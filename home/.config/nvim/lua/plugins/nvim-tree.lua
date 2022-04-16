return function()
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_highlight_opened_files = 2;
  vim.g.nvim_tree_allow_resize = 1
  vim.g.nvim_tree_indent_markers = 1

  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
  }

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "",
      untracked = ""
      -- deleted = "",
      -- ignored = "◌",
      -- renamed = "➜",
      -- staged = "✓",
      -- unmerged = "",
      -- unstaged = "✗",
      -- untracked = "★",
    },
    folder = {
      default = "",
      open = "",
      arrow_open = "",
      arrow_closed = ""
    },
  }

  map("n", "<leader><leader>", ":NvimTreeToggle<cr>", {noremap = true})

  require("nvim-tree").setup {
    auto_close = true,
    update_focused_file = {
      enable = true
    },
    git = {
      ignore = false,
    },
    view = {
      side = "left",
      width = 35
    },
    actions = {
      open_file = {
        quit_on_open = true
      }
    }
  }
end
