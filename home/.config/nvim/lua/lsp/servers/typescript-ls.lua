return function(config, on_attach)
  local util = require("lspconfig/util")

  config.tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {"typescript", "javascript", "javascriptreact", "typescriptreact"},
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", vim.fn.getcwd()),
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end
  }
end
