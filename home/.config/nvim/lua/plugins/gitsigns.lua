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
        watch_gitdir = {
            interval = 1000
        },
        sign_priority = 6,
        status_formatter = nil,
        update_debounce = 100,
        diff_opts = {
            internal = true
        }
    }
end
