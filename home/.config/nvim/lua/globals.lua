_G.installLsp = function()
  -- https://github.com/mattn/vim-lsp-settings should be installed
  -- and that set to download in single dir   vim.g.lsp_settings_servers_dir = vim.fn.stdpath("cache") .. "/lspconfig"
  vim.cmd [[set filetype=typescript]]
  vim.cmd [[LspInstallServer typescript-language-server]]
  vim.cmd [[set filetype=sh]]
  vim.cmd [[LspInstallServer bash-language-server]]
  vim.cmd [[set filetype=json]]
  vim.cmd [[LspInstallServer json-languageserver]]
end

_G.printt = function(tbl)
  print(vim.inspect(tbl))
end

_G.fmt = function()
  vim.lsp.buf.formatting_sync(nil, 500)
end