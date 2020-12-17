return function()
  local ts_config = require('nvim-treesitter.configs')
  ts_config.setup {
    ensure_installed = {
      'javascript',
      'typescript',
      'clojure',
      'kotlin',
      'html',
      'ruby',
      'json',
      'tsx',
      'lua',
      'css'
    },
    highlight = {
      enabled = true
    },
  }
end
