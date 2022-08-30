return function()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {
            "javascript",
            "html",
            "css",
            "ruby",
            "json",
            "clojure",
            "bash",
            "lua",
            "erlang",
            "elixir",
            "go"
        },
        indent = {
            enable = {"javascriptreact"}
        },
        highlight = {
            enable = true,
            use_languagetree = true
        },
        context_commentstring = {
            enable = true
        },
        matchup = {
            enable = true
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 1000,
            colors = {
                "#bf616a",
                "#d08770",
                "#ebcb8b",
                "#a3be8c",
                "#88c0d0",
                "#5e81ac",
                "#b48ead"
            }
        }
    }
end
