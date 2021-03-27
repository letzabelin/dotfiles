return function(config)
  local util = require "lspconfig/util"

  config.cssls.setup {
    cmd = { "css-languageserver", "--stdio" },
    filetypes = { "css", "scss", "sass" },
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    settings = {
      css = {
        validate = true
      },
      scss = {
        validate = true
      },
      sass = {
        validate = true
      }
    }
  }
end
