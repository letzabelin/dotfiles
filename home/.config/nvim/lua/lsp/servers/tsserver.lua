return function(on_attach)
    return {
        filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            -- tsserver, stop messing with prettier da fuck!
            client.server_capabilities.document_formatting = false
            require("nvim-lsp-ts-utils").setup {}
        end
    }
end
