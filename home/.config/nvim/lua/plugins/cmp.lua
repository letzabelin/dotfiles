local function fillSpacesToFixed(str, untilLength)
    local untilFixed = untilLength - string.len(str)
    local postfix = ''
    for i = 1, untilFixed, 1 do postfix = postfix .. ' ' end
    return str .. postfix
end

local format = function(entry, vim_item)
    local menuMapping = {
        buffer = ' |buf|',
        path = '|pth|',
        nvim_lua = '|vim|',
        nvim_lsp = ' |lsp|'
        -- luasnip = '|snp|'
    }
    local prettySourceName = menuMapping[entry.source.name]

    if prettySourceName == nil then
        -- text buff like git commit or so
        vim_item.menu = prettySourceName
    else
        -- buffers with code mostly
        vim_item.menu = '|' .. fillSpacesToFixed(vim_item.kind, 8) ..
                            prettySourceName
    end

    vim_item.kind = require('lspkind').symbolic(vim_item.kind,
                                                {with_text = false})
    return vim_item
end

return {
    'hrsh7th/nvim-cmp',
    enabled = true,
    event = 'VeryLazy',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path', 'onsails/lspkind-nvim'
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            completion = {completeopt = 'menu,menuone,noinsert,noselect'},
            formatting = {fields = {'kind', 'abbr', 'menu'}, format = format},
            experimental = {native_menu = false, ghost_text = true},
            window = {
                completion = {
                    border = {
                        '╭', '─', '╮', '│', '╯', '─', '╰', '│'
                    },
                    winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
                    scrollbar = '║'
                },
                documentation = {
                    border = {
                        '─', '─', '╮', '│', '╯', '─', '─', '→'
                    }
                }
            },
            -- snippet = {
            --     expand = function(args)
            --         require('luasnip').lsp_expand(args.body)
            --     end
            -- },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert
                }), {"i", "s"}),
                ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert
                }), {"i", "s"}),
                ["<Down>"] = cmp.mapping(
                    cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert
                    }), {"i", "s"}),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert
                }), {"i", "s"}),
                ["<CR>"] = cmp.mapping(cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                }), {"i", "s"})
                -- ["<Tab>"] = cmp.mapping(function(fallback)
                --     if vim.fn["vsnip#available"]() == 1 then
                --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
                --     elseif cmp.visible() then
                --         cmp.select_next_item()
                --     else
                --         fallback()
                --     end
                -- end, {"i", "s"}),
                -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                --     if vim.fn["vsnip#available"]() == 1 then
                --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
                --     elseif cmp.visible() then
                --         cmp.select_next_item()
                --     -- elseif check_back_space() then
                --     --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "")
                --     else
                --         fallback()
                --     end
                -- end, {"i", "s"})
            }),
            sources = cmp.config.sources({
                {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'}
            })
        })

        cmp.setup.filetype('lua', {
            sources = {
                {
                    name = 'nvim_lua',
                    trigger_characters = {'.'},
                    max_item_count = 20
                }
            }
        })
    end
}
