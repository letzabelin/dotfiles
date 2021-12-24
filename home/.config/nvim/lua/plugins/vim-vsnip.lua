return function()
    g.vsnip_extra_mapping = false
    g.vsnip_snippet_dir = fn.stdpath("config") .. "/snippets"

    -- vim.api.nvim_exec(
    --     [[
    --         let g:vsnip_filetypes = {}
    --         let g:vsnip_filetypes.typescript = ['javascript']
    --         let g:vsnip_filetypes.javascriptreact = ['javascript', 'javascriptreact']
    --         let g:vsnip_filetypes.typescriptreact = ['javascriptreact', 'typescript']
    --     ]],
    --     true
    -- )
end
