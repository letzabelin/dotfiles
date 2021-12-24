return function()
    require "bufferline".setup {
        options = {
            offsets = {{filetype = "NvimTree", text = "", padding = 1}},
            buffer_close_icon = "",
            modified_icon = "",
            show_close_icon = false,
            max_name_length = 35,
            max_prefix_length = 0,
            tab_size = 25,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            show_buffer_close_icons = true,
            separator_style = "thin",
        },
        highlights = {
            fill = {
                guibg = "#1e1e1e"
            }
        }
    }

    map("n", "<leader>n", ":BufferLineCycleNext<cr>")
    map("n", "<leader>p", ":BufferLineCyclePrev<cr>")
end
