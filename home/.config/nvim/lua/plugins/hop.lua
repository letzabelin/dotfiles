return function()
    require("hop").setup {
        keys = "etovxqpdygfblzhckisuran"
    }

    map("n", "<leader>s", "<cmd>lua require('hop').hint_char1()<cr>")
end
