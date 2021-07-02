return function(config, on_attach)
    local util = require "lspconfig/util"

    local eslint_d = {
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintStdin = true,
        lintFormats = {"%f:%l:%c: %m"},
        lintIgnoreExitCode = true,
        formatCommand = "eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}",
        formatStdin = true
    }

    local luaFormat = {
        formatCommand = "luafmt --stdin",
        formatStdin = true
    }

    local prettier = {
        formatCommand = "prettier --stdin-filepath ${INPUT}",
        formatStdin = true
    }

    local languages = {
        javascript = {eslint_d},
        typescript = {eslint_d},
        typescriptreact = {eslint_d},
        javascriptreact = {eslint_d},
        lua = {luaFormat}
    }

    config.efm.setup {
        default_config = {
            cmd = "efm-langserver"
        },
        root_dir = util.root_pattern(".git", vim.fn.getcwd()),
        init_options = {
            documentFormatting = true,
            codeAction = true
        },
        settings = {
            languages = languages
        },
        filetypes = {
            "javascript",
            "typescript",
            "typescriptreact",
            "javascriptreact",
            "lua"
        },
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
        end
    }
end
