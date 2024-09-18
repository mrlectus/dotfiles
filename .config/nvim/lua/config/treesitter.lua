local function contains(arr, item)
	for _, value in pairs(arr) do
		if value == item then
			return true
		end
	end
	return false
end

require("nvim-treesitter.configs").setup({
	ignore_install = {},
	modules = { "*" },
	-- List of parsers to ignore installing (or "all")
	-- A list of parser names, or "all"
	ensure_installed = "all",
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = function(lang, buf)
			local langs =
				{ "typescriptreact", "javascriptreact", "jsx", "c", "rust", "javascript", "tsx", "typescript" }
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if (ok and stats and stats.size > max_filesize) or contains(langs, lang) then
				return true
			end
		end,
	},
	indent = {
		enable = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
