return function()
  local ts_config = require('nvim-treesitter.configs')
  ts_config.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      use_languagetree = true,
      indent = {
        enable = true
      }
    }
  }

  require('nvim-treesitter.highlight')
  vim.treesitter.highlighter.hl_map["punctuation.delimiter"] = "Delimiter"
  vim.treesitter.highlighter.hl_map["punctuation.bracket"] = nil
end
