-- return function(on_attach)
--     local prettier_pug = {
--         formatCommand = "prettier --tab-width 4 --stdin-filepath ${INPUT}",
--         formatStdin = true,
--         lintSeverity = 2
--     }
--     local prettier_sh = {
--         formatCommand = "prettier --tab-width 4 --stdin-filepath ${INPUT}",
--         formatStdin = true,
--         lintSeverity = 2
--     }
--     local prettier = {
--         -- formatCommand = 'prettierd --stdin --stdin-filepath ${INPUT}',
--         formatCommand = 'prettierd "${INPUT}"',
--         formatStdin = true
--     }
--     local yaml = {
--         lintCommand = "yamllint -f parsable -",
--         lintStdin = true,
--         formatCommand = "prettier --tab-width 4 --stdin-filepath ${INPUT}",
--         formatStdin = true,
--         lintSeverity = 2
--     }
--     local eslint_d = {
--         lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--         lintStdin = true,
--         lintFormats = {"%f:%l:%c: %m"},
--         lintIgnoreExitCode = true,
--         -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--         -- formatStdin = true,
--         lintSeverity = 2
--     }
--     local luaFormat = {
--         formatCommand = "luafmt --stdin",
--         formatStdin = true,
--         lintSeverity = 2
--     }
--     local filetypeConfigMap = {
--         typescript = {prettier, eslint_d},
--         javascript = {prettier, eslint_d},
--         typescriptreact = {prettier, eslint_d},
--         javascriptreact = {prettier, eslint_d},
--         lua = {luaFormat},
--         sh = {prettier_sh},
--         zsh = {prettier_sh},
--         pug = {prettier_pug},
--         yaml = {yaml}
--     }
--     return {
--         init_options = {
--             documentFormatting = true,
--             codeAction = true
--         },
--         settings = {
--             languages = filetypeConfigMap,
--             -- Note: Debounce should be fairly enough not to run multiple efm instances to a file.
--             --  (https://github.com/mattn/efm-langserver/issues/98)
--             -- lintDebounce = 1e9 -- (nano seconds)
--         },
--         filetypes = keys(filetypeConfigMap),
--         on_attach = on_attach
--     }
-- end

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
        single_file_support = false,
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
