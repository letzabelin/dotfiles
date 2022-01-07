return function()
    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    -- ["<C-p>"] = false,
                    -- ["<C-n>"] = false,
                    -- ["<C-j>"] = actions.move_selection_next,
                    -- ["<C-k>"] = actions.move_selection_previous,
                }
            }
        },
        -- extensions = {
        --   fzf = {
        --       fuzzy = true,
        --        override_generic_sorter = true,
        --        override_file_sorter = true,
        --        case_mode = "smart_case",
        --   }
        -- }
    });
    -- {
        -- extensions = {
    --         dash = {
    --             -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
    --             dash_app_path = "/Applications/Setapp/Dash.app",
    --             -- debounce while typing, in milliseconds
    --             debounce = 0,
    --             -- map filetype strings to the keywords you've configured for docsets in Dash
    --             -- setting to false will disable filtering by filetype for that filetype
    --             -- filetypes not included in this table will not filter the query by filetype
    --             -- check lua/dash.config.lua to see all defaults
    --             -- the values you pass for file_type_keywords are merged with the defaults
    --             -- to disable filtering for all filetypes,
    --             -- set file_type_keywords = false
    --             file_type_keywords = {
    --                 dashboard = false,
    --                 NvimTree = false,
    --                 TelescopePrompt = false,
    --                 terminal = false,
    --                 packer = false,
    --                 -- a table of strings will search on multiple keywords
    --                 javascript = {"javascript", "nodejs"},
    --                 typescript = {"typescript", "javascript", "nodejs"},
    --                 typescriptreact = {"typescript", "javascript", "react"},
    --                 javascriptreact = {"javascript", "react"}
    --                 -- you can also do a string, for example,
    --                 -- bash = 'sh'
    --             }
    --         }
        -- }
    -- }()
    local horizontalLayoutConfig = "layout_strategy='horizontal',layout_config={width=0.9, height=0.9, mirror=false, preview_width=0.4}"
    local verticalLayoutConfig = "layout_strategy='vertical',layout_config={width=0.9, height=0.9, preview_cutoff=0}"

    map("n", "<leader>gf", "<CMD>lua require('telescope.builtin').git_files({" .. horizontalLayoutConfig .. "})<CR>")

    map(
        "n",
        "<leader>ff",
        "<CMD>lua require('telescope.builtin').find_files({hidden=true," .. horizontalLayoutConfig .. "})<CR>"
    )

    map(
        "n",
        "<leader>aa",
        "<CMD>lua require('telescope.builtin').live_grep({additional_args=function(options) return {'--hidden', '-F'} end," ..
            verticalLayoutConfig .. "})<CR>"
    )

    map(
        "n",
        "<leader>aA",
        "<CMD>lua require('telescope.builtin').live_grep({additional_args=function(options) return {'--hidden', '--no-ignore', '-F'} end," ..
            verticalLayoutConfig .. "})<CR>"
    )

    map("n", "go", "<CMD>lua require('telescope.builtin').grep_string({" .. horizontalLayoutConfig .. "})<CR>")

    map(
        "n",
        "gO",
        "<CMD>lua require('telescope.builtin').grep_string({additional_args=function(options) return {'--hidden', '--no-ignore'} end," ..
            verticalLayoutConfig .. "})<CR>"
    )

    map(
        "n",
        "<leader>b",
        "<CMD>lua require('telescope.builtin').buffers({sort_lastused=true," .. horizontalLayoutConfig .. "})<CR>"
    )

    map(
        "n",
        "<leader>ol",
        "<CMD>lua require('telescope.builtin').oldfiles({cwd_only=true," .. horizontalLayoutConfig .. "})<CR>"
    )

    map("n", "<leader>oo", "<CMD>lua require('telescope.builtin').resume()<CR>")

    map("n", "<leader>gc", "<CMD>lua require('telescope.builtin').git_commits()<CR>")
    map("n", "<leader>gb", "<CMD>lua require('telescope.builtin').git_branches()<CR>")
    map("n", "<leader>gs", "<CMD>lua require('telescope.builtin').git_status()<CR>")

    -- require('telescope').load_extension('fzf')
end
