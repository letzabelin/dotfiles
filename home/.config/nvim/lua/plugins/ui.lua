local util = require('util')

return {
    {
        'sainnhe/edge',
        lazy = false,
        config = function()
            -- vim.o.background = 'light'
            vim.cmd('colorscheme edge')

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
}
