return function()
  local prettierFormatter = function()
    return {
      exe = "npx prettier",
      args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
      stdin = true
    }
  end

  require "formatter".setup({
    logging = true,
    filetype = {
      typescript = { prettierFormatter },
      javascript = { prettierFormatter },
      javascriptreact = { prettierFormatter },
      typescriptreact = { prettierFormatter },
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
  })

  vim.api.nvim_command("autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx FormatWrite")
end
