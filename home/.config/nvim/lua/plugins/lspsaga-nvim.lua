return function()
  require "lspsaga".init_lsp_saga({
    use_saga_diagnostic_sign = true,
    code_action_prompt = {
      enable = false,
    }
  })

  -- map("n", "<A-i>", "<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>")
end
