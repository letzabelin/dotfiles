return function()
  local map = require("utils").map

  vim.g.bufferline = {
    animation = false,
    icon_separator_active = "▎",
    icon_separator_inactive = "▎",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    closable = false,
    clickable = true,
    semantic_letters = true,
    letters = "arstgkneiARSTGKNEOI",
    maximum_padding = 4
  }

  vim.cmd("cnoreabbrev bo BufferCloseAllButCurrent")
  vim.cmd("cnoreabbrev bd BufferClose")

  map("n", "<C-s>", ":BufferPick<CR>", { noremap = true, silent = true })
  map("n", "<S-Up>", ":BufferNext<cr>")
  map("n", "<S-Down>", ":BufferPrevious<cr>")
end
