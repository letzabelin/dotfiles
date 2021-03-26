return function(config)
  local util = require "lspconfig/util"

  local eslint_d = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
  }

  local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
  }

  local languages = {
    typescript = {prettier, eslint_d},
    javascript = {prettier, eslint_d},
    typescriptreact = {prettier, eslint_d},
    javascriptreact = {prettier, eslint_d},
  }

  config.efm.setup {
    default_config = {
      cmd = "efm-langserver"
    },
    root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    init_options = {
      documentFormatting = true,
      codeAction = true
    },
    settings = {
      languages = languages
    },
    filetypes = {
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
    }
  }
end
