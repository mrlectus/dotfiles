vim.g.loaded_netrw = 1
vim.opt.updatetime = 300
vim.g.loaded_netrwPlugin = 1
vim.treesitter.stop = true

-- environment for home
local set = vim.opt
set.filetype = "off" --disable filetype detection (but re-enable later, see below)
HOME = os.getenv("HOME")
set.compatible = false -- disable compatibility mode with vi

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.splitright = true

-- vim.lsp.set_log_level("debug")

--Set highlight on search
set.hlsearch = true

--Enable mouse mode

--Enable break indent
set.breakindent = true

-- Fold

set.foldmethod = "expr"

--Save undo history
set.undofile = true

--Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

--Decrease update time
set.updatetime = 250
vim.wo.signcolumn = "yes"

set.clipboard:prepend({ "unnamedplus" })
set.completeopt:prepend("menuone,noselect,noinsert")

set.list = true
set.number = true --show line numbers
set.wrap = false --wrap lines

--set.spell spelllang=en_us
set.encoding = "utf-8" --set encoding to UTF-8 (default was "latin1")
set.wildmenu = true --visual autocomplete for command menu
set.colorcolumn = "120"
set.textwidth = 140
set.showmatch = true --highlight matching parentheses / brackets [{()}]
set.laststatus = 2 --always show statusline (even with only single window)
set.ruler = true --show line and column number of the cursor on right side of statusline
set.visualbell = true --blink cursor on error, instead of beeping

-- Tab settings
set.expandtab = true
set.tabstop = 2 -- width that a <TAB> character displays as
set.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
set.softtabstop = 2 -- backspace after pressing <TAB> will remove up to this many spaces

set.autoindent = true -- copy indent from current line when starting a new line
set.smartindent = true -- even better autoindent (e.g. add indent after '{')

set.cursorline = true -- highlight current line
set.autoread = true -- autoreload the file in Vim if it has been changed outside of Vim
set.swapfile = false
set.relativenumber = true
set.showtabline = 0

-- Search settings
set.incsearch = true -- search as characters are entered
set.hlsearch = true -- highlight matches

vim.g.indentLine_setColors = 0
vim.g.indentLine_char = "▏"

vim.g.python_host_prog = "/bin/python2.7"
vim.g.python3_host_prog = "/bin/python3"
vim.g.perl_host_prog = "/bin/perl"
vim.g.node_host_prog = "/bin/neovim-node-host"
vim.g.ruby_host_prog = "$HOME/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host"

vim.g.dashboard_default_executive = "telescope"

vim.g.user_emmet_expandabbr_key = "<c-e>"
set.background = "dark" -- configure Vim to use brighter colors

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
