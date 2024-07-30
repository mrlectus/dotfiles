-- Utilities for creating configurations
require("conform").setup({
  formatters_by_ft = {
    javascriptreact = { "prettierd", "prettier", "eslint_d" },
    typescriptreact = { "prettierd", "prettier", "eslint_d" },
    tex = { "latexindent", args = "-w" },
    caddyfile = { "caddyfile" },
    python = { "black" },
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },
  format_after_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_format = "fallback",
    timeout_ms = 1500,
  },
  notify_on_error = true,
  notify_no_formatters = true,
  formatters = {
    caddyfile = {
      command = "caddy",
      args = { "fmt", "$FILENAME" },
      stdin = true,
      cwd = require("conform.util").root_file({ "Caddyfile" }),
      require_cwd = true,
      exit_codes = { 1 },
    }
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
