local lsp_status = require("lsp-status")
--- require
require("cmp").config.formatting = {
	format = require("tailwindcss-colorizer-cmp").formatter,
}
require("servers..keybind")
require("servers..bashls")
require("servers..cssls")
--require("servers..ccls")
require("servers..gopls")
require("servers..html")
require("servers..luals")
require("servers..yamls")
require("servers..phpactor")
require("lspconfig").dartls.setup({})
require("servers..pylsp")
require("servers..rust_analyzer")
require("servers..sqls")
require("servers..texlab")
require("servers..tsserver")
require("lspconfig").puppet.setup({})
require("config..barbar")
require("servers..javals")
require("servers..kotlinls")
require("config..theme")
require("config..mini")
require("config..colors")
-- require("config..autopair")
require("config..devicons")
require("config..autotag")
require("config..alpha")
require("config..evil_lualine")
require("config..lspkind")
require("config..dap")
require("config..noice")
-- require("config..ai")
require("dapui").setup()
require("config..telescope")
require("config..cmp")
-- require("config..treesitter")
require("config..gitsign")
-- require("config..luasnip")
-- require("config..snippy")
require("config..format")
require("colorizer").setup({})
require("lspconfig").emmet_ls.setup({})
require("which-key").setup({})
require("lspconfig").pyre.setup({})
require("lsp_signature").setup({
	floating_window = false,
	hint_enable = true, -- virtual hint enable
	hint_prefix = "🐼 ", -- Panda for parameter
	hint_scheme = "String",
})

lsp_status.register_progress()
-- Go-to definition in a split window
local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api

	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		if split_cmd then
			vim.cmd(split_cmd)
		end

		if vim.islist(result) then
			util.jump_to_location(result[1])

			if #result > 1 then
				util.set_qflist(util.locations_to_items(result))
				api.nvim_command("copen")
				api.nvim_command("wincmd p")
			end
		else
			util.jump_to_location(result)
		end
	end

	return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		source = "always", -- Or "if_many"
	},
})

-- last
vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]])
vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]])
