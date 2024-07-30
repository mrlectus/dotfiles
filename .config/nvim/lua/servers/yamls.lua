require("lspconfig").ansiblels.setup({})
require("lspconfig").dockerls.setup({})
require 'lspconfig'.docker_compose_language_service.setup {}
require 'lspconfig'.taplo.setup {}
require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] =
        "/*.k8s.yaml",
      },
    },
  },
})
