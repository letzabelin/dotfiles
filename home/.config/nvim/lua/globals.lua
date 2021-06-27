local api = vim.api
local cmd = vim.cmd

_G.reload = function()
  local modules = {"lsp", "plugins", "globals", "mappings", "settings"}
  for _, moduleName in pairs(modules) do
    for packageName, _ in pairs(package.loaded) do
      if string.find(packageName, "^" .. moduleName) then
        package.loaded[packageName] = nil
      end
    end
    require(moduleName)
  end
end

_G.range = function(from, to)
  local result = {}
  for i = from, to do
    result[i] = i
  end
  return result
end

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

function _G.fmt()
  if ft() == "json" then
    vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
    return
  end

  if ft() == "typescript" then
    require "nvim-lsp-ts-utils".organize_imports_sync()
  end

  vim.lsp.buf.formatting_sync(nil, 500)
  -- vim.lsp.buf.formatting()
  cmd("w | :e | TSBufEnable highlight")
end

function _G.completion_confirm()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](require("nvim-autopairs").esc("<cr>"))
    else
      return require("nvim-autopairs").esc("<cr>")
    end
  else
    return require("nvim-autopairs").autopairs_cr()
  end
end
