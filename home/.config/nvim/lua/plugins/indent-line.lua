return function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"
    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
    vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "alpha", "NvimTree"}
    vim.g.indent_blankline_buftype_exclude = {"terminal"}
    vim.wo.colorcolumn = "99999"

    require("indent_blankline").setup {
        char_highlight_list = {}
    }
end
