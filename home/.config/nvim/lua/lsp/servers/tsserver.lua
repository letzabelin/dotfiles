return function(on_attach)
    return {
        filetypes = {"typescript", "javascript"},
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            -- tsserver, stop messing with prettier da fuck!
            client.resolved_capabilities.document_formatting = false
            require("nvim-lsp-ts-utils").setup {}
        end
    }
end

-- return function(config, on_attach)
--     config.typescript.setup {
--         filetypes = {"typescript", "javascript", "javascriptreact", "typescriptreact"},
--         on_attach = function(client, bufnr)
--             on_attach(client, bufnr)
--             client.resolved_capabilities.document_formatting = false
--             require("nvim-lsp-ts-utils").setup {}
--         end
--     }
-- end
