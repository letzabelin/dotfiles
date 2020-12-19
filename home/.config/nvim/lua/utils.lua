local M = {}

M.map = function(mod, shortсut, action, options or {})
  vim.api.nvim_set_keymap(mod, shortcut, action, options)
end

return M
