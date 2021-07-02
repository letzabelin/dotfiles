return function()
    local prettierFormatter = function()
        return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
        }
    end

    require "formatter".setup(
        {
            logging = true,
            filetype = {
                typescript = {prettierFormatter},
                javascript = {prettierFormatter},
                javascriptreact = {prettierFormatter},
                typescriptreact = {prettierFormatter}
            }
        }
    )

    map("n", "<leader>f", "<cmd>Format<cr>")
end
