local lsp_config = require("lspconfig")
local lsp_completion = require("completion")
local map = require("utils").map

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local general_on_attach = function(client, bufnr)
  local mappingOptions = {noremap = true, silent = true}

  lsp_completion.on_attach(client, bufnr)
  vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", mappingOptions)
  vim.api.nvim_set_keymap("n", "'re", "<cmd>lua vim.lsp.buf.references()<CR>", mappingOptions)
  vim.api.nvim_set_keymap("n", "'rn", "<cmd>lua vim.lsp.buf.rename()<CR>", mappingOptions)
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
  vim.api.nvim_command("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })")
end

-- Setup basic lsp servers
for _, server in pairs({ "bashls", "html", "cssls" }) do
  lsp_config[server].setup {
    capabilities = capabilities,
    on_attach = general_on_attach
  }
end

-- JSON
lsp_config.jsonls.setup {
  on_attach = general_on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}

-- Tsserver
lsp_config.tsserver.setup {
  on_attach = function(client, bufnr)
    general_on_attach(client, bufnr)
  end
}

-- Solargraph
lsp_config.solargraph.setup {
  settings = {
    solargraph = {
      commandPath = "~/.asdf/shims/solargraph",
      diagnostics = true,
      completion = true,
      formatting = true
    }
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    general_on_attach(client, bufnr)
  end
}

-- Setup errors ui
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true
  }
)

-- Write only if diffs there
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd [[noautocmd :update]]
    end
  end
end

-- Setup diagnostic linters and formatters
lsp_config.diagnosticls.setup({
  on_attach = general_on_attach,
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact", "ruby"},
  init_options = {
    filetypes = {javascript = "eslint", typescript = "eslint", ruby = "rubocop"},
    rubocop = {
      command = 'bundle',
      sourceName = 'rubocop',
      args = {
        'exec',
        'rubocop',
        '--format',
        'json',
        '--force-exclusion',
        '%filepath'
      },
      parseJson = {
        errorsRoot = 'files[0].offenses',
        line = 'location.line',
        column = 'location.column',
        message = '[${cop_name}]\n${message}',
        security = 'severity'
      },
      securities = {
        fatal = 'error',
        warning = 'warning'
      }
    },
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
vim.fn.sign_define("LspDiagnosticsSignError",       { numhl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning",     { numhl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { numhl = "LspDiagnosticsSignInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint",        { numhl = "LspDiagnosticsSignHint" })
