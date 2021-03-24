return function(config, on_attach)
  local util = require "lspconfig/util"
  config.yamlls.setup {
    cmd = {"yaml-language-server", "--stdio"},
    filetypes = {"yaml", "yml"},
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    on_attach = on_attach
  }
end
