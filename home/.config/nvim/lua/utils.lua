local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local U = {}

-- Key mapping
function U.map(mode, shortcut, action, opts)
  opts = opts or {}
  fn.nvim_set_keymap(mode, shortcut, action, opts)
end

return U
