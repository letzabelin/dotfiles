return function()
  require "lspsaga".init_lsp_saga({
    use_saga_diagnostic_sign = true,
    code_action_prompt = {
      enable = false,
    }
  })
end
