local lsp_config = require("lspconfig")
local lsp_completion = require("completion")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local general_on_attach = function(client, bufnr)
  if client.resolved_capabilities.completion then
    lsp_completion.on_attach(client, bufnr)
  end
  local mappingOptions = {noremap = true, silent = true}
  if client.resolved_capabilities.hover then
    vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", mappingOptions)
  end
  if client.resolved_capabilities.find_references then
    vim.api.nvim_set_keymap("n", "'re", "<cmd>lua vim.lsp.buf.references()<CR>", mappingOptions)
  end
  if client.resolved_capabilities.rename then
    vim.api.nvim_set_keymap("n", "'rn", "<cmd>lua vim.lsp.buf.rename()<CR>", mappingOptions)
  end
  vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", mappingOptions)
  vim.api.nvim_set_keymap("n", "'i", "<cmd>Implementations<CR>", mappingOptions)
  vim.api.nvim_set_keymap("n", "'a", "<cmd>CodeActions<cr>", mappingOptions)
  vim.api.nvim_set_keymap(
    "n",
    "[d",
    "<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { show_header = false } })<CR>",
    mappingOptions
  )
  vim.api.nvim_set_keymap(
    "n",
    "]d",
    "<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { show_header = false } })<CR>",
    mappingOptions
  )
  vim.api.nvim_set_keymap("n", "'d", "<cmd>Diagnostics<CR>", mappingOptions)

  vim.api.nvim_command("setlocal omnifunc=lua.vim.lsp.omnifunc")
  vim.api.nvim_command("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })")
end

-- Setup basic lsp servers
for _, server in pairs({"vimls", "jsonls", "bashls", "html", "cssls"}) do
  lsp_config[server].setup {
    capabilities = capabilities,
    on_attach = general_on_attach
  }
end

-- Tsserver
lsp_config.tsserver.setup {
  on_attach = function(client, bufnr)
    general_on_attach(client, bufnr)
  end
}

-- Solargraph
lsp_config.solargraph.setup({
  on_attach = function(client, bufnr)
    general_on_attach(client, bufnr)
  end
})

-- Setup errors ui
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = false,
    signs = false,
    update_in_insert = true
  }
)

-- Setup diagnostic linters and formatters
lsp_config.diagnosticls.setup({
  on_attach = general_on_attach,
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
  init_options = {
    filetypes = {javascript = "eslint", typescript = "eslint"},
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
})

-- Define line number hl for lines with Lsp errors
vim.fn.sign_define("LspDiagnosticsSignError", {numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {numhl = "LspDiagnosticsSignHint"})
