return {
    {
        'kyazdani42/nvim-tree.lua',
        lazy = false,
        config = function()
            vim.api.nvim_set_keymap("n", "<leader><leader>",
                                    ":NvimTreeToggle<cr>", {noremap = true})

            require("nvim-tree").setup({
                update_focused_file = {enable = true},
                git = {ignore = false},
                view = {side = "left", width = 35},
                actions = {open_file = {quit_on_open = true}},
                filters = {custom = {"^.DS_Store$"}},
                renderer = {
                    highlight_git = true,
                    highlight_opened_files = "name",
                    indent_markers = {enable = true},
                    icons = {
                        show = {
                            git = true,
                            folder = true,
                            file = true,
                            folder_arrow = true
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
                            },
                            folder = {
                                default = "",
                                open = "",
                                arrow_open = "",
                                arrow_closed = ""
                            }
                        }
                    }
                }
            })
        end
    }
}
