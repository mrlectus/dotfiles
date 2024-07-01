local M = {}
local MAX_KIND_WIDTH = 11

M.icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰡱",
  Constructor = "",
  Field = "󰜢",
  Variable = "󱀍",
  Class = "",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 25

local get_ws = function(max, len)
  return (" "):rep(max - len)
end

-- Set up nvim-cmp.
local format = function(_, item)
  local content = item.abbr
  local kind_symbol
  if M and M.icons and item and item.kind then
    kind_symbol = M.icons[item.kind] or "" -- Use an empty string if the icon is not found
    kind_symbol = kind_symbol .. " (" .. item.kind .. ")"
  else
    kind_symbol = "" -- Or handle the case where M or item is nil
  end

  item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
  else
    item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
  end

  return item
end

local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = format,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4),  -- Down
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp", keyword_length = 2 },
    { name = "calc" },
    { name = "omni" },
    { name = "path" },
    { name = "buffer",   keyword_length = 3 },
    { name = "emoji" },
  }, {
    { name = "buffer" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})
require("cmp_git").setup()

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
