local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

function _G.au(event, filetype, action)
  vim.cmd("au" .. " " .. event .. " " .. filetype .. " " .. action)
end

function _G.map(mode, shortcut, action, opts)
  opts = opts or {}
  fn.nvim_set_keymap(mode, shortcut, action, opts)
end
