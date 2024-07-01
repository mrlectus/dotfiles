return {
  { "bluz71/vim-nightfly-colors", name = "nightfly",   lazy = false,   priority = 1000 },
  { "bluz71/vim-moonfly-colors",  name = "moonfly",    lazy = false,   priority = 1000 },
  { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "EdenEast/nightfox.nvim" }, -- lazy
}
