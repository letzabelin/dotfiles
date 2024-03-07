local util = require('util')

return {
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     config = function()
    --         require('github-theme').setup({
    --             -- ...
    --         })

    --         vim.cmd('colorscheme github_dark_dimmed')
    --     end
    -- }, 
    -- {
    --     "p00f/alabaster.nvim",
    --     lazy = false,
    --     config = function()
    --         vim.cmd('colorscheme alabaster')
    --         vim.o.background = 'light'
    --     end
    -- },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,

        config = function()
            vim.cmd('colorscheme catppuccin')

            local nvim_tree_color_names = {
                "NvimTreeOpenedFolderName", "NvimTreeFolderName",
                "NvimTreeSymlink", "NvimTreeRootFolder", "NvimTreeFolderIcon",
                "NvimTreeEmptyFolderName", "NvimTreeExecFile",
                "NvimTreeSpecialFile", "NvimTreeImageFile",
                "NvimTreeMarkdownFile", "NvimTreeIndentMarker"
            }

            for _, color_name in ipairs(nvim_tree_color_names) do
                util.hi(0, color_name, {fg = "#ABB2BF"})
            end

            util.hi(0, "NvimTreeFileNew", {fg = "#979922"})
            util.hi(0, "NvimTreeFileDirty", {fg = "#d59a27"})
            util.hi(0, "NvimTreeOpenedFile", {fg = "#6a9e6b"})
        end
    }
    -- {
    --     'sainnhe/edge',
    --     lazy = false,
    --     config = function()
    --         -- vim.o.background = 'light'
    --         vim.cmd('colorscheme edge')

    --         local nvim_tree_color_names = {
    --             "NvimTreeOpenedFolderName", "NvimTreeFolderName",
    --             "NvimTreeSymlink", "NvimTreeRootFolder", "NvimTreeFolderIcon",
    --             "NvimTreeEmptyFolderName", "NvimTreeExecFile",
    --             "NvimTreeSpecialFile", "NvimTreeImageFile",
    --             "NvimTreeMarkdownFile", "NvimTreeIndentMarker"
    --         }

    --         for _, color_name in ipairs(nvim_tree_color_names) do
    --             util.hi(0, color_name, {fg = "#ABB2BF"})
    --         end

    --         util.hi(0, "NvimTreeFileNew", {fg = "#979922"})
    --         util.hi(0, "NvimTreeFileDirty", {fg = "#d59a27"})
    --         util.hi(0, "NvimTreeOpenedFile", {fg = "#6a9e6b"})
    --     end
    -- }
}
