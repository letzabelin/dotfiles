return function()
    local global = vim.g

    global.nvim_tree_side = "left"
    global.nvim_tree_width = 50
    global.nvim_tree_auto_close = 1
    global.nvim_tree_quit_on_open = 1
    global.nvim_tree_git_hl = 1
    global.nvim_tree_allow_resize = 1
    global.nvim_tree_follow = 1
    global.nvim_tree_highlight_opened_files = 2

    global.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1
    }

    global.nvim_tree_icons = {
        default = "",
        symlink = "",
        -- git = {
        --   unstaged = "✗",
        --   staged = "✓",
        --   unmerged = "",
        --   renamed = "➜",
        --   untracked = "★"
        -- },
        git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            untracked = ""
        },
        folder = {
            default = "",
            open = "",
            arrow_open = "",
            arrow_closed = ""
        }
    }

    map("n", "<leader><leader>", ":NvimTreeToggle<CR>", {noremap = true})
end
