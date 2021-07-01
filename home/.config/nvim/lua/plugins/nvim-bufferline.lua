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
      mappings = "true"
    },
    -- options = {
    --   numbers = "none",
    --   modified_icon = "🖍",
    --   separator_style = {"", ""},
    --   custom_filter = function(buf_number)
    --     if vim.fn.bufname(buf_number) == "" then
    --       return false
    --     end
    --     return true
    --   end
    -- },
    highlights = {
      fill = {
        guibg = "#1e1e1e"
      },
    }
    --   background = {
    --     guibg = "none"
    --   },
    --   tab = {
    --     guibg = "none"
    --   },
    --   duplicate = {
    --     guibg = "none"
    --   },
    --   buffer_selected = {
    --     guifg = "#e5c463"
    --   },
    --   indicator_selected = {
    --     guibg = "none",
    --     guifg = {
    --       attribute = "bg",
    --       highlight = "Normal"
    --     }
    --   },
    --   modified = {
    --     guibg = "none"
    --   }
    -- }
  }

  map("n", "<A-n>", ":BufferLineCycleNext<cr>")
  map("n", "<A-p>", ":BufferLineCyclePrev<cr>")
  map("n", "<A-s>", ":BufferLinePick<cr>")
end
