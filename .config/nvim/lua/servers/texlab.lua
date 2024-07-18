require("lspconfig").texlab.setup({
  setting = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "tectonic",
        forwardSearchAfter = false,
        onSave = true
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = true
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {},
        executable = "zathura",
        onSave = false
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      },
      linter = "chktex",
    }
  }
})
require("lspconfig").marksman.setup({})
