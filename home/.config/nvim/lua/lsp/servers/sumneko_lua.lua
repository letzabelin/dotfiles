return function(config, on_attach)
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    return {
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path
                },
                diagnostics = {
                    globals = {"vim", "use"}
                },
                workspace = {
                    library = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                },
                telemetry = {
                    enable = false
                }
            }
        }
    }
end
