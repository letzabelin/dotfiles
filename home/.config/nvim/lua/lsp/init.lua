local lsp_installer = require("nvim-lsp-installer")

local servers = {"jsonls", "tsserver", "yamlls", "cssls", "solargraph", "dockerls", "html", "gopls"}

_G.installLspServers = function()
    cmd("LspUninstallAll")
    local serversString = ""
    for _, name in pairs(servers) do
        serversString = serversString .. " " .. name
    end
    cmd("LspInstall" .. serversString)
end

lsp_installer.on_server_ready(
    function(server)
        -- todo https://github.com/williamboman/nvim-lsp-installer/issues/63
        if not includes(servers, server.name) then
            return
        end

        local general_on_attach = require("lsp.on_attach")

        local serverConfig = require("lsp.servers." .. server.name)(general_on_attach)
        serverConfig.flags = {debounce_text_changes = 100, lintDebounce = 200}
        serverConfig.capabilities = serverConfig.capabilities or
            require("cmp_nvim_lsp").default_capabilities()

        server:setup(serverConfig)
        vim.cmd [[ do User LspAttachBuffers ]]

        require("lsp.settings")()
    end
)
