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

            local hi = function(group, options)
                vim.cmd("hi " .. group .. " " .. "cterm=" ..
                            (options.cterm or "none") .. " " .. "ctermfg=" ..
                            (options.ctermfg or "none") .. " " .. "ctermbg=" ..
                            (options.ctermbg or "none") .. " " .. "gui=" ..
                            (options.gui or "none") .. " " .. "guifg=" ..
                            (options.guifg or "none") .. " " .. "guibg=" ..
                            (options.guibg or "none"))
            end

            local nvim_tree_color_names = {
                "NvimTreeOpenedFolderName", "NvimTreeFolderName",
                "NvimTreeSymlink", "NvimTreeRootFolder", "NvimTreeFolderIcon",
                "NvimTreeEmptyFolderName", "NvimTreeExecFile",
                "NvimTreeSpecialFile", "NvimTreeImageFile",
                "NvimTreeMarkdownFile", "NvimTreeIndentMarker"
            }

            for _, color_name in ipairs(nvim_tree_color_names) do
                hi(color_name, {guifg = "#ABB2BF"})
            end

            hi("NvimTreeFileNew", {guifg = "#979922"})
            hi("NvimTreeFileDirty", {guifg = "#d59a27"})
            hi("NvimTreeOpenedFile", {guifg = "#6a9e6b"})
        end
    }
}
