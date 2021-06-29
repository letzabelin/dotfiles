return function()
  require("gitsigns").setup {
    signs = {
      add = {hl = "GitGutterAdd", text = "│", numhl = ""},
      change = {hl = "GitGutterChange", text = "│", numhl = ""},
      delete = {hl = "GitGutterDelete", text = "│", numhl = ""},
      topdelete = {hl = "GitGutterDelete", text = "│", numhl = ""},
      changedelete = {hl = "GitGutterDelete", text = "│", numhl = ""}
    },
    numhl = true,
    watch_index = {
      interval = 1000
    },
    sign_priority = 6,
    status_formatter = nil,
    update_debounce = 100,
    use_decoration_api = true,
    use_internal_diff = true,
  }
end
