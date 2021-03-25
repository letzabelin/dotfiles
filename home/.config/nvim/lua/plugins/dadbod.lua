return function()
  vim.g.db_ui_auto_execute_table_helpers = 1
  vim.g.dbs = {
    dev = 'postgres://andrew:1234@localhost:5432/learning_ruby_development'
  }
end
