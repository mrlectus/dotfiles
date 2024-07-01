local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
})
require("lspconfig").prismals.setup({})
require("flutter-tools").setup({}) -- use defaults
require("typescript-tools").setup({
	settings = {
		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
			includeInlayVariableTypeHints = true,
			includeInlayFunctionParameterTypeHints = false,
			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = false,
			includeInlayFunctionLikeReturnTypeHints = true,
		},
	},
})
require("lspconfig").solc.setup({})
