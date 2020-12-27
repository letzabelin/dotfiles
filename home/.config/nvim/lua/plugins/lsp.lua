local lsp_config = require('lspconfig')
local lsp_completion = require('completion')
local lsp_status = require('lsp-status')

vim.g.completion_chain_complete_list = {
  default = { { complete_items = { 'lsp', 'tabnine', 'vim-vsnip', 'buffers' } } },
  sql = { { complete_items = { 'vim-dadbod-completion' } } },
}

vim.g.completion_items_priority = {
  Field = 10,
  Method = 10,
  ['vim-vsnip'] = 9,
  Function = 9,
  Variables = 9,
  Constant = 9,
  Interfaces = 8,
  Class = 8,
  Struct = 8,
  Keyword = 8,
  Treesitter = 8,
  TabNine = 8,
  Buffers = 1,
  File = 2,
}

vim.g.completion_sorting = "length"
vim.g.completion_matching_strategy_list = {'exact', 'fuzzy'}
vim.g.completion_matching_smart_case = 1
vim.g.completion_auto_change_source = 1
vim.g.completion_trigger_character = {'.', '::'}
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_tabnine_priority = 5
vim.g.completion_tabnine_sort_by_details = 1
vim.g.completion_confirm_key = ''
vim.api.nvim_set_keymap('i', '<cr>', [[pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<C-e>\<cr>" : "\<cr>"]], { expr = true })

vim.g.completion_customize_lsp_label = {
  Function = ' [function]',
  Method = ' [method]',
  Reference = ' [reference]',
  Enum = ' [enum]',
  Field = 'ﰠ [field]',
  Keyword = ' [key]',
  Variable = ' [variable]',
  Folder = ' [folder]',
  ['vim-vsnip'] = ' [snippet]',
  Operator = ' [operator]',
  Module = ' [module]',
  Text = 'ﮜ[text]',
  Class = ' [class]',
  Interface = ' [interface]'
}

local general_on_attach = function(client, bufnr)
  local mappingOptions = {noremap = true, silent = true}

  lsp_completion.on_attach(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  vim.api.nvim_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', mappingOptions)
  vim.api.nvim_set_keymap('n', 'K',     '<cmd>lua vim.lsp.buf.hover()<CR>',          mappingOptions)
  vim.api.nvim_set_keymap('n', "'i",    '<cmd>Implementations<CR>',                  mappingOptions)
  vim.api.nvim_set_keymap('n', "'re",   '<cmd>lua vim.lsp.buf.references()<CR>',     mappingOptions)
  vim.api.nvim_set_keymap('n', "'rn",   '<cmd>lua vim.lsp.buf.rename()<CR>',         mappingOptions)
  vim.api.nvim_set_keymap('n', "'a",    '<cmd>CodeActions<cr>',                      mappingOptions)
  vim.api.nvim_set_keymap('n', "'d",    '<cmd>Diagnostics<CR>',                      mappingOptions)
  vim.api.nvim_set_keymap('n', '[d',
    '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { show_header = false } })<CR>',
    mappingOptions
  )
  vim.api.nvim_set_keymap('n', ']d',
    '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { show_header = false } })<CR>',
    mappingOptions
  )

  vim.api.nvim_command('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })')
  vim.api.nvim_command('autocmd BufWritePre * FormatWrite')
end

lsp_status.register_progress()
lsp_status.config {
  current_function = false,
  indicator_errors = "E:",
  indicator_warnings = "W:",
  indicator_info = "I:",
  indicator_hint = "H:",
  indicator_ok = "",
  status_symbol = "",
  spinner_frames     = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
}

-- Setup basic lsp servers
for _, server in pairs({"vimls", "jsonls", "bashls", "html"}) do
  lsp_config[server].setup {
    capabilities = lsp_status.capabilities,
    on_attach = general_on_attach
  }
end

-- Tsserver, stop messing with prettier da fuck!
lsp_config.tsserver.setup {
  capabilities = lsp_status.capabilities,
  on_attach = function(client, bufnr)
    general_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
}

-- Setup errors ui
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false,
    virtual_text = false,
    signs = false,
    update_in_insert = true
  }
)

local prettierFormatter = function()
  return {
    exe = "npx prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup {
  logging = true,
  filetype = {
    typescript = { prettierFormatter },
    javascript = { prettierFormatter },
    lua = {
      function()
        return {
          exe = "npx luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  }
}

-- Setup diagnostic linters and formatters
lsp_config.diagnosticls.setup {
  capabilities = lsp_status.capabilities,
  on_attach = general_on_attach,
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
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
}

-- Define line number hl for lines with Lsp errors
vim.fn.sign_define("LspDiagnosticsSignError",       { numhl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning",     { numhl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { numhl = "LspDiagnosticsSignInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint",        { numhl = "LspDiagnosticsSignHint" })
