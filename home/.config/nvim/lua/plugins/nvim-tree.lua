return function()
  -- vim.g.nvim_tree_allow_resize = 1

  map("n", "<leader><leader>", ":NvimTreeToggle<cr>", {noremap = true})

  require("nvim-tree").setup {
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
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "name",
      indent_markers = {
        enable = true
      },
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow =true
        },
        glyphs = {
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
      }
    }
  }
end
