return function()
    vim.fn.sign_define("LspDiagnosticsSignError", {numhl = "LspDiagnosticsSignError", text = ""})
    vim.fn.sign_define("LspDiagnosticsSignWarning", {numhl = "LspDiagnosticsSignWarning", text = ""})
    vim.fn.sign_define("LspDiagnosticsSignInformation", {numhl = "LspDiagnosticsSignInformation", text = ""})
    vim.fn.sign_define("LspDiagnosticsSignHint", {numhl = "LspDiagnosticsSignHint", text = ""})

    require("vim.lsp.protocol").CompletionItemKind = {
        "ﮜ [text]",
        " [method]",
        " [function]",
        " [constructor]",
        "ﰠ [field]",
        " [variable]",
        " [class]",
        " [interface]",
        " [module]",
        " [property]",
        " [unit]",
        " [value]",
        " [enum]",
        " [key]",
        " [snippet]",
        " [color]",
        " [file]",
        " [reference]",
        " [folder]",
        " [enum member]",
        " [constant]",
        " [struct]",
        "⌘ [event]",
        " [operator]",
        "⌂ [type]"
    }
end
