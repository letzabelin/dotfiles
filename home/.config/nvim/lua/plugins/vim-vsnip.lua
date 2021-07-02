return function()
    local options = {expr = true}

    vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"
    vim.g.vsnip_namespace = ""

    map("i", "<tab>", [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>']], options)
    map("s", "<tab>", [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<tab>']], options)
    map("i", "<s-tab>", [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>']], options)
    map("s", "<s-tab>", [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>']], options)

    vim.api.nvim_exec(
        [[
            let g:vsnip_filetypes = {}
            let g:vsnip_filetypes.typescript = ['javascript']
            let g:vsnip_filetypes.javascriptreact = ['javascript', 'javascriptreact']
            let g:vsnip_filetypes.typescriptreact = ['javascriptreact', 'typescript']
        ]],
        true
    )
end
