return function()
  -- vim.api.nvim_create_autocmd('User', {
  --     pattern = 'PackerCompileDone',
  --     callback = function()
  --         vim.cmd 'CatppuccinCompile'
  --         vim.defer_fn(function() vim.cmd 'colorscheme catppuccin' end, 0) -- Defered for live reloading
  --     end
  -- })

  -- local colors = require('catppuccin.palettes').get_palette()
  -- colors.bg = colors.base

  -- vim.g.catppuccin_flavour = 'macchiato'
  -- require('catppuccin').setup({
  --     transparent_background = true,
  --     compile = {enabled = true},
  --     integrations = {
  --         lsp_trouble = true,
  --         lightspeed = true,
  --         native_lsp = {
  --             enabled = true,
  --             virtual_text = {},
  --             virtual_lines = {},
  --             underlines = {}
  --         }
  --     },
  --     custom_highlights = {
  --         DiagnosticVirtualTextError = {bg = colors.bg, fg = colors.error}
  --     }
  -- })
  -- --  hi('DiagnosticVirtualTextError', {guibg = 'none', guifg = colors.error})

  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = false,
      mini = false,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })

  -- setup must be called before loading
  vim.cmd.colorscheme "catppuccin"
end
