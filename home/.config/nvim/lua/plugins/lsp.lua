local lsp_config = require("lspconfig")
-- local lsp_completion = require("completion")
local util = require "lspconfig/util"

-- _G._show_diagnostics = function(opts)
  --     opts = opts or {}
  --     vim.lsp.diagnostic.set_loclist({open_loclist = false})
  --     require "telescope.builtin".loclist(opts)
  -- end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local function repeatFunc(fn)
    local function timedFn()
      local wait = fn()
      vim.defer_fn(timedFn, wait)
    end
    timedFn()
  end

  local general_on_attach =  function(client, bufnr)
    local options = {noremap = true, silent = true}
    if client.resolved_capabilities.completion then
      -- lsp_completion.on_attach(client, bufnr)
    end
    if client.resolved_capabilities.hover then
      map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", options)
    end
    if client.resolved_capabilities.find_references then
      map("n", "'re", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", options)
    end
    if client.resolved_capabilities.goto_definition then
      map("n", "'d", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
    end
    if client.resolved_capabilities.rename then
      map("n", "'rn", "<cmd>lua require'lspsaga.rename'.rename()<CR>", options)
    end

    map("n", "'i", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    map("n", "'a", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", options)
    map("v", "'a", "<cmd>lua require'lspsaga.codeaction'.range_code_action()<CR>", options)

    -- require "timer".add(
    -- function()
    --   if vim.fn.mode() == "i" then
    --     require("lspsaga.signaturehelp").signature_help()
    --   end
    --   return 1000
    -- end
    -- )

    -- require "timer".add(
    -- function()
    --   if vim.fn.mode() == "n" then
    --     require "lspsaga.diagnostic".show_line_diagnostics()
    --   end
    --   return 2000
    -- end
    -- )

    map("n", "'D", "<cmd>Diagnostics<CR>", options)
    -- map("n", "'D", "<cmd>lua _show_diagnostics()<CR>", options)
    map("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", options)
    map("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", options)

    au("bufwritepost", "*", "lua vim.lsp.buf.formatting_sync(nil, 500)")
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
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", vim.fn.getcwd()),
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

  -- setup errors ui
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
  -- write only if diffs there
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
      linters = {
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
require "vim.lsp.protocol".CompletionItemKind = {
  "ﮜ[text]",
  " [metGod]",
  " [function]",
  " [constructor]",
  "ﰠ [field]",
  " [variable]",
  " [class]",
  " [interface]",
  " [module]",
  " [property]",
  " [unit]",
  " [value]",
  " [enum]",
  " [key]",
  " [snippet]",
  " [color]",
  " [file]",
  " [reference]",
  " [folder]",
  " [enum member]",
  " [constant]",
  " [struct]",
  "⌘ [event]",
  " [operator]",
  "⌂ [type]"
}
