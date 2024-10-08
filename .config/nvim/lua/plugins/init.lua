return {
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "echasnovski/mini.nvim", version = "*" },
	"p00f/clangd_extensions.nvim",
	"github/copilot.vim",
	"petertriho/cmp-git",
	{
		"neovim/nvim-lspconfig",
		inlay_hints = { enabled = true },
	},
	"folke/lsp-colors.nvim",
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"leoluz/nvim-dap-go",
	"folke/which-key.nvim",
	"gko/vim-coloresque",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{ "lukas-reineke/indent-blankline.nvim" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	"mattn/emmet-vim",
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
	},
	"isobit/vim-caddyfile",
	"dcampos/cmp-emmet-vim",
	"mfussenegger/nvim-jdtls",
	"mhartington/formatter.nvim",
	"nanotee/sqls.nvim",
	"nvim-lua/lsp-status.nvim",
	"nvim-lua/plenary.nvim",
	"hood/popui.nvim",
	{ "kdheepak/lazygit.nvim", lazy = false },
	"nvim-treesitter/playground",
	"onsails/lspkind-nvim",
	"udalov/kotlin-vim",
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	"simrat39/rust-tools.nvim",
	{ "akinsho/flutter-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = { bind = true, handler_opts = {
			border = "rounded",
		} },
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
