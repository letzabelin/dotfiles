local api = vim.api
local cmd = vim.cmd

function _G.au(event, filetype, action)
  vim.cmd("au" .. " " .. event .. " " .. filetype .. " " .. action)
end

function _G.map(mode, shortcut, action, opts)
  opts = opts or {}
  api.nvim_set_keymap(mode, shortcut, action, opts)
end

function _G.ft()
  return vim.api.nvim_buf_get_option(0, "filetype")
end
