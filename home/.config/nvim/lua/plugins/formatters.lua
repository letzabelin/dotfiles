return function()
    local prettierFormatter = function()
        return {
            exe = "npx prettierd",
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

    -- map("n", "<leader>t", "<cmd>Format<cr>")
end
