local navic = require('nvim-navic')

return function(client, bufnr)
    local options = {noremap = true, silent = true}

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, options)

    vim.keymap.set('n', '\'rn', function() vim.lsp.buf.rename() end, options)

    vim.keymap.set('n', '[d',
                   function() vim.diagnostic.goto_prev({float = false}) end,
                   options)

    vim.keymap.set('n', ']d',
                   function() vim.diagnostic.goto_next({float = false}) end,
                   options)

    vim.keymap.set('n', '\'gr', function()
        require'telescope.builtin'.lsp_references({
            layout_strategy = 'vertical',
            layout_settings = {width = 0.9, height = 0.9}
        })
    end, options)

    vim.keymap
        .set('n', '\'gd', function() vim.lsp.buf.definition() end, options)

    vim.keymap.set('n', '\'gi', function() vim.lsp.buf.implementation() end,
                   options)

    vim.keymap.set('n', '\'a', '<cmd>CodeActionMenu<CR>', options)

    vim.cmd("au" .. " " .. "cursorhold" .. " " .. "*" .. " " ..
                'lua vim.diagnostic.open_float(0, { scope = "line", border = "single", focusable = false })')

    vim.keymap.set('i', '<c-k>', function() vim.lsp.buf.signature_help() end,
                   options)

    vim.keymap.set('n', '<leader>e', function()
        vim.lsp.buf.format({
            async = false,
            filter = function(filterClient)
                return filterClient.name == 'null-ls'
            end
        })
    end, options)
end
