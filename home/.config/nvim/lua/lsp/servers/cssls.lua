return function(on_attach)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return {
        filetypes = {"css", "scss", "less"},
        capabilities = capabilities,
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
            on_attach(client)
        end
    }
end
