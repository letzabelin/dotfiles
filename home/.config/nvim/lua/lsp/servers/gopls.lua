return function(on_attach)
    return {
        filetypes = {"go", "gomod", "gowork", "gotmpl"},
        on_attach = on_attach,
    }
end
