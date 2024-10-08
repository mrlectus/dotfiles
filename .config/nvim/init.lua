vim.opt.termguicolors = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Set map leader
vim.g.mapleader = ","
require("options")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true },
	defaults = { lazy = true },
})
require("settings")
