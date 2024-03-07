return {
    -- repeat.vim remaps . in a way that plugins can tap into it.
    {'tpope/vim-repeat', event = 'VeryLazy'},
    {"farmergreg/vim-lastplace", lazy = false},
    -- {"gpanders/nvim-parinfer", lazy = false},
    {"editorconfig/editorconfig-vim", event = 'VeryLazy'},
    -- surrounding parentheses, brackets, quotes, XML tags, and more.
    {"tpope/vim-surround", event = 'VeryLazy', version = '*'},
    -- after yank leave cursor on its place
    {'svban/YankAssassin.vim', event = 'VeryLazy'},
    -- additional mappings, [<leader> - add new line before cursor, [b - prev buffer and ]b - next buffer
    {"tpope/vim-unimpaired", event = "VeryLazy"},
    {"sindrets/diffview.nvim", event = "VeryLazy"}, {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = {"n", "x", "o"},
                function() require("flash").jump() end,
                desc = "Flash"
            }
        },
        config = function()
            require("flash").setup({modes = {search = {enabled = false}}})
        end
    }, {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup({fast_wrap = {}})

            -- remove add single quote on filetype scheme or lisp
            require("nvim-autopairs").get_rules("'")[1].not_filetypes = {
                'clojure'
            }
            require("nvim-autopairs").get_rules("`")[1].not_filetypes = {
                'clojure'
            }
        end
    }, {"AndrewRadev/switch.vim", event = 'VeryLazy'}, {
        "mattn/emmet-vim",
        event = "VeryLazy",
        config = function()
            vim.g.user_emmet_settings = {
                html = {indent_blockelement = 1},
                javascript = {extends = "jsx"}
            }
        end
    }, {
        "m-demare/hlargs.nvim",
        event = {'BufEnter'},
        config = function() require('hlargs').setup({}) end
    }, {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        main = "ibl",
        config = function()
            require("ibl").setup({scope = {enabled = false}})
        end
    }, {
        "akinsho/bufferline.nvim",
        version = 'v3.*',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        event = {'BufEnter *.*'},
        config = function()
            require"bufferline".setup({
                options = {
                    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
                    buffer_close_icon = "",
                    modified_icon = "",
                    show_close_icon = false,
                    max_name_length = 35,
                    max_prefix_length = 0,
                    tab_size = 25,
                    show_tab_indicators = true,
                    enforce_regular_tabs = false,
                    show_buffer_close_icons = true,
                    separator_style = "thin"
                },
                highlights = {fill = {bg = "#1e1e1e"}}
            })

            vim.api.nvim_set_keymap("n", "<leader>n",
                                    ":BufferLineCycleNext<cr>", {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("n", "<leader>p",
                                    ":BufferLineCyclePrev<cr>", {
                noremap = true,
                silent = true,
                expr = false
            })
        end
    }, -- fast comment/uncomment lines
    {
        'numToStr/Comment.nvim',
        lazy = false,
        dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'},
        config = function()
            local ft = require('Comment.ft')

            require('Comment').setup({ignore = '^$'})

            ft.set('clojure', ';;%s')
        end
    }, {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufReadPost',
        build = ':TSUpdate',
        config = function()
            local parser_configs =
                require('nvim-treesitter.parsers').get_parser_configs()
            parser_configs.http = {
                install_info = {
                    url = 'https://github.com/NTBBloodbath/tree-sitter-http',
                    files = {'src/parser.c'},
                    branch = 'main'
                }
            }
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "javascript", "html", "css", "json", "clojure", "lua",
                    "comment", "python", "c_sharp"
                },
                indent = {enable = true},
                highlight = {
                    enable = true, -- false will disable the whole extension
                    indent = {enable = true},
                    use_languagetree = true
                },
                ts_context_commentstring = {enable = true},
                autotag = {enable = true},
                auto_install = false,
                matchup = {
                    enable = true -- mandatory, false will disable the whole extension
                }
            })
        end
    }, {
        'goolord/alpha-nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        lazy = false,
        config = function()
            require'alpha'.setup(require'alpha.themes.startify'.config)
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')

            dashboard.section.header.val = {
                '                                                     ',
                '                                                     ',
                '                                                     ',
                '                                                     ',
                '                                                     ',
                '                                                     ',
                '                                                     ',
                '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
                '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
                '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
                '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
                '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
                '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
                '                                                     '
            }

            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file",
                                 ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("q", "  > Quit NVIM", ":qa<CR>")
            }

            dashboard.section.footer.val = require('alpha.fortune')()

            alpha.setup(dashboard.opts)
        end
    }, -- delete buffer
    {
        "moll/vim-bbye",
        event = "VeryLazy",
        config = function() vim.cmd("cnoreabbrev bd Bdelete") end
    }, -- delete all buffers except the current
    {
        "schickling/vim-bufonly",
        event = "VeryLazy",
        config = function() vim.cmd("cnoreabbrev bo Bonly") end
    }, {
        "smjonas/live-command.nvim",
        config = function()
            require("live-command").setup({
                commands = {Norm = {cmd = "norm"}, G = {cmd = "g"}}
            })
        end
    }, {
        "voldikss/vim-floaterm",
        lazy = false,
        config = function()
            vim.g.floaterm_width = 0.9
            vim.g.floaterm_height = 0.9
            vim.g.floaterm_title = "TERMINAL"
            vim.api.nvim_set_keymap("n", "<c-e>", [[:FloatermToggle<CR>]], {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("t", "<c-e>",
                                    [[<C-\><C-n>:FloatermToggle<CR>]], {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.cmd [[hi FloatermBorder guibg=none guifg=none ]]
        end
    }, {
        'windwp/nvim-spectre',
        dependencies = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
        cmd = 'Replace',
        config = function()
            require("spectre").setup({
                color_devicons = true,
                line_sep_start = "┌-----------------------------------------",
                result_padding = "¦  ",
                line_sep = "└-----------------------------------------",
                highlight = {
                    ui = "String",
                    search = "DiffDelete",
                    replace = "DiffChange"
                }
            })

            vim.api
                .nvim_command("command! Replace :lua require'spectre'.open()")
        end
    }, {
        'windwp/nvim-ts-autotag',
        event = 'BufReadPost',
        dependencies = {'nvim-treesitter/nvim-treesitter'},
        config = function() require('nvim-ts-autotag').setup() end
    }, {'SmiteshP/nvim-navic', dependencies = {'neovim/nvim-lspconfig'}},
    {'matze/vim-move', event = 'VeryLazy'},
    {
        'andymass/vim-matchup',
        event = 'VeryLazy',
        version = nil,
        branch = 'master'
    }, {
        'Wansmer/treesj',
        keys = {{'gS', function() require('treesj').toggle() end, mode = {'n'}}},
        dependencies = {'nvim-treesitter/nvim-treesitter'},
        event = "VeryLazy",
        config = function()
            require('treesj').setup({use_default_keymaps = false})
        end
    }, {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        config = function()
            vim.g.gitblame_enabled = false
            vim.g.gitblame_message_template =
                "<author> • <sha> • <date> • <summary>"
            vim.api.nvim_set_keymap("n", "<leader>gm",
                                    "<cmd>GitBlameToggle<cr>", {
                noremap = true,
                silent = true,
                expr = false
            })
        end
    }, {
        "lewis6991/gitsigns.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        event = 'BufEnter',
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = {hl = "GitGutterAdd", text = "│", numhl = ""},
                    change = {hl = "GitGutterChange", text = "│", numhl = ""},
                    delete = {hl = "GitGutterDelete", text = "│", numhl = ""},
                    topdelete = {
                        hl = "GitGutterDelete",
                        text = "│",
                        numhl = ""
                    },
                    changedelete = {
                        hl = "GitGutterDelete",
                        text = "│",
                        numhl = ""
                    }
                },
                numhl = true,
                watch_gitdir = {interval = 1000},
                sign_priority = 6,
                status_formatter = nil,
                update_debounce = 100,
                diff_opts = {internal = true}
            })
        end
    }, {
        "numToStr/Navigator.nvim",
        lazy = false,
        config = function()
            require("Navigator").setup {
                auto_save = "current",
                disable_on_zoom = false
            }

            vim.api.nvim_set_keymap("n", "<c-h>",
                                    "<CMD>lua require('Navigator').left()<CR>",
                                    {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("n", "<c-j>",
                                    "<CMD>lua require('Navigator').down()<CR>",
                                    {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("n", "<c-k>",
                                    "<CMD>lua require('Navigator').up()<CR>", {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("n", "<c-l>",
                                    "<CMD>lua require('Navigator').right()<CR>",
                                    {
                noremap = true,
                silent = true,
                expr = false
            })
        end
    }, {
        "talek/obvious-resize",
        config = function()
            vim.g.obvious_resize_default = 4
            vim.g.obvious_resize_run_tmux = 1
            vim.api.nvim_set_keymap("", "<c-up>", ":ObviousResizeUp<cr>", {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("", "<c-down>", ":ObviousResizeDown<cr>", {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("", "<c-left>", ":ObviousResizeLeft<cr>", {
                noremap = true,
                silent = true,
                expr = false
            })
            vim.api.nvim_set_keymap("", "<c-right>", ":ObviousResizeRight<cr>",
                                    {
                noremap = true,
                silent = true,
                expr = false
            })
        end
    }, {
        "julienvincent/nvim-paredit",
        lazy = false,
        config = function() require("nvim-paredit").setup({}) end
    }, {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            {'kevinhwang91/promise-async'}, {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup({
                        relculright = true,
                        segments = {
                            {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
                            {text = {"%s"}, click = "v:lua.ScSa"},
                            {
                                text = {builtin.lnumfunc, " "},
                                click = "v:lua.ScLa"
                            }
                        }
                    })
                end

            }
        },
        lazy = false,
        init = function()
            vim.o.fillchars =
                [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = -1
            vim.o.foldenable = true
        end,
        config = function()
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (' < %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, {chunkText, hlGroup})
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix ..
                                         (' '):rep(
                                             targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, {suffix, 'MoreMsg'})
                return newVirtText
            end

            require('ufo').setup({
                fold_virt_text_handler = handler,
                provider_selector = function()
                    return {'treesitter', 'indent'}
                end
            })
        end
    }, {
        'Wansmer/symbol-usage.nvim',
        event = 'BufReadPre',
        config = function()
            local function text_format(symbol)
                local fragments = {}

                if symbol.references then
                    local usage = symbol.references <= 1 and 'ref' or 'refs'
                    local num = symbol.references == 0 and 'no' or
                                    symbol.references
                    table.insert(fragments, ('%s %s'):format(num, usage))
                end

                if symbol.definition then
                    table.insert(fragments, symbol.definition .. ' defs')
                end

                if symbol.implementation then
                    table.insert(fragments, symbol.implementation .. ' impls')
                end

                return table.concat(fragments, ', ')
            end

            require('symbol-usage').setup({text_format = text_format})
        end
    }
}
