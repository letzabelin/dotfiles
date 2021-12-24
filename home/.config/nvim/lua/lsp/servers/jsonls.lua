-- return function(config, on_attach)
--     return {
--         on_attach = on_attach,
--         -- settings = {
--         --     json = {
--         --         schemas = require("schemastore").json.schemas()
--         --     }
--         -- }
--     }
-- end
return function(config, on_attach)
    config.json.setup {
        on_attach = on_attach
    }
end
