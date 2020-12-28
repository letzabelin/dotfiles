return function()
  vim.g.completion_chain_complete_list = {
    default = { { complete_items = { "lsp", "tabnine", "vim-vsnip", "buffers" } } },
    sql = { { complete_items = { "vim-dadbod-completion" } } },
  }

  vim.g.completion_items_priority = {
    Field = 10,
    Method = 10,
    Function = 9,
    Variables = 9,
    Constant = 9,
    Interfaces = 8,
    Class = 8,
    Struct = 8,
    Keyword = 8,
    Treesitter = 8,
    TabNine = 8,
    ["vim-vsnip"] = 7,
    Buffers = 1,
    File = 2,
  }

  vim.g.completion_sorting = "length"
  vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy", "all" }
  vim.g.completion_matching_smart_case = 1
  vim.g.completion_auto_change_source = 1
  vim.g.completion_trigger_character = {".", "::"}
  vim.g.completion_enable_snippet = "vim-vsnip"
  vim.g.completion_tabnine_priority = 5
  vim.g.completion_tabnine_sort_by_details = 1
  vim.g.completion_confirm_key = ""
  vim.api.nvim_set_keymap("i", "<cr>", [[pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<C-e>\<cr>" : "\<cr>"]], { expr = true })

  vim.g.completion_customize_lsp_label = {
    Function = " [function]",
    Method = " [method]",
    Reference = " [reference]",
    Enum = " [enum]",
    Field = "ﰠ [field]",
    Keyword = " [key]",
    Variable = " [variable]",
    Folder = " [folder]",
    ["vim-vsnip"] = " [snippet]",
    Operator = " [operator]",
    Module = " [module]",
    Text = "ﮜ[text]",
    Class = " [class]",
    Interface = " [interface]"
  }
end
