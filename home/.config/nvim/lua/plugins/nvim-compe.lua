return function()
  require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    allow_prefix_unmatch = true,
    source = {
      path = {menu = " "},
      buffer = {menu = " "},
      vsnip = {menu = " "},
      nvim_lsp = {menu = "  "},
      nvim_lua = {menu = " "},
      spell = true,
      vim_dadbod_completion = true,
      calc = true,
      tags = true,
      treesitter = true
    }
  }

  map("i", "<cr", "compe#confirm(lexima#expand('<LT>CR>', 'i'))", { noremap = true, silent = true, expr = true })
end
