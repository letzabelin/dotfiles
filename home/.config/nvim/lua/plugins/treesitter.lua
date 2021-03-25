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
    indent = {
      enable = true
    },
    highlight = {
      enable = true,
      use_languagetree = true
    }
  }
end
