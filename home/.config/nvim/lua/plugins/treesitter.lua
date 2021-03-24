return function()
  require "nvim-treesitter.configs".setup {
    ensure_installed = {
      "javascript",
      "html",
      "css",
      "ruby",
      "json",
      "clojure",
      "bash"
    },
    highlight = {
      enable = true,
      indent = {
        enable = true
      },
      use_languagetree = true
    }
  }
end
