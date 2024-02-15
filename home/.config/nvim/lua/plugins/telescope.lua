return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        {'nvim-telescope/telescope-live-grep-args.nvim'},
        'benfowler/telescope-luasnip.nvim'
    },
    cmd = {'Telescope'},
    keys = {
        {
            'gf', function()
                require('telescope.builtin').git_files({
                    layout_strategy = 'horizontal',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        mirror = false,
                        preview_width = 0.4
                    }
                })
            end
        }, {
            '<leader>ff', function()
                require('telescope.builtin').find_files({
                    hidden = true,
                    layout_strategy = 'horizontal',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        mirror = false,
                        preview_width = 0.4
                    }
                })
            end
        }, {
            '<leader>aa', function()
                require('telescope.builtin').live_grep({
                    additional_args = function(options)
                        return {'--hidden', '-F'}
                    end,
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 0
                    }
                })
            end
        }, {
            '<leader>aA', function()
                require('telescope.builtin').live_grep({
                    additional_args = function(options)
                        return {'--hidden', '--no-ignore', '-F'}
                    end,
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 0
                    }
                })
            end
        }, {
            'go', function()
                require('telescope.builtin').grep_string({
                    layout_strategy = 'horizontal',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        mirror = false,
                        preview_width = 0.4
                    }
                })
            end
        }, {
            'gO', function()
                require('telescope.builtin').grep_string({
                    additional_args = function(options)
                        return {'--hidden', '--no-ignore'}
                    end,
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 0
                    }
                })
            end
        }, {
            '<leader>b', function()
                require('telescope.builtin').buffers({
                    sort_lastused = true,
                    layout_strategy = 'horizontal',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        mirror = false,
                        preview_width = 0.4
                    }
                })
            end
        }, {
            '<leader>ol', function()
                require('telescope.builtin').oldfiles({
                    cwd_only = true,
                    layout_strategy = 'horizontal',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        mirror = false,
                        preview_width = 0.4
                    }
                })
            end
        }, {'<leader>oo', function()
            require('telescope.builtin').resume()
        end}, {
            '<leader>gc', function()
                require('telescope.builtin').git_commits({
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 0
                    }
                })
            end
        },
        {
            '<leader>gb',
            function() require('telescope.builtin').git_branches() end
        },
        {'<leader>gs', function()
            require('telescope.builtin').git_status()
        end}
    }
}
