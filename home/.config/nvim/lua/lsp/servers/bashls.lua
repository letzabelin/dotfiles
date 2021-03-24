return function(config, on_attach)
  local util = require "lspconfig/util"
  config.bashls.setup {
    cmd = {"bash-language-server", "start"},
    filetypes = {"sh"},
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    on_attach = on_attach,
  }
end
