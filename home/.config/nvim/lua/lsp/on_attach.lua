return function(client, bufnr)
  local options = {noremap = true, silent = true}
  if client.resolved_capabilities.completion then
    -- lsp_completion.on_attach(client, bufnr)
  end
  if client.resolved_capabilities.hover then
    map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", options)
  end
  if client.resolved_capabilities.find_references then
    map("n", "'re", "<cmd>References<cr>", options)
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

  require "timer".add(
  function()
    if vim.fn.mode() == "i" then
      if not require("lspsaga.signaturehelp").has_saga_signature() then
        require("lspsaga.signaturehelp").signature_help()
      end end
      return 2000
    end
    )

  require "timer".add(
  function()
    if vim.fn.mode() == "n" then
      require "lspsaga.diagnostic".show_line_diagnostics()
    end
    return 1000
  end
  )

  map("n", "'D", "<cmd>Diagnostics<CR>", options)
  map("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", options)
  map("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", options)

  au("bufwritepost", "*", ":lua vim.lsp.buf.formatting()")
end
