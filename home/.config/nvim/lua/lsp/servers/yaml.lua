return function(config, on_attach)
  config.yaml.setup {
    filetypes = {"yaml", "yml"},
    on_attach = on_attach
  }
end
