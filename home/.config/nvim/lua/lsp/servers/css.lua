return function(config)
    config.css.setup {
        filetypes = {"css", "scss", "sass"},
        settings = {
            css = {
                validate = true
            },
            scss = {
                validate = true
            },
            sass = {
                validate = true
            }
        }
    }
end
