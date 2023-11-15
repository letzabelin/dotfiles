return function(on_attach)
    return {
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
            on_attach(client)
        end
    }
end
