local util = require('util')
local common = require('lsp.servers.common')
return function(on_attach)
    return util.t.merge('force', common, {
        on_attach = on_attach,
        settings = {
            -- json = {
            --     schemas = require('schemastore').json.schemas(),
            --     validate = {enable = true}
            -- }
        }
    })
end
