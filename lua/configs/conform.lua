local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    svelte = { "prettierd" },
    json = { "prettierd" },
    terraform = { "terraform_fmt" },
    cs = { "csharpier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    proto = { "buf" },
  },

  formatters = {
    -- fix until https://github.com/stevearc/conform.nvim/pull/695 is merged
    csharpier = {
      command = "csharpier",
      args = { "format" },
    },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
