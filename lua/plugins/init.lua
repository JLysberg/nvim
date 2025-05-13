return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.nvimtreesitter",
  },

  ------------ non-default reconfigurations ------------

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "css-lsp",
        "html-lsp",
        "prettierd",
        "eslint_d",
        "prisma-language-server",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "csharpier",
        "omnisharp",
        "terraform-ls",
        "ruff",
        "pyright",
      },
    },
  },

  ------------ custom plugins ------------

  {
    "folke/zen-mode.nvim",
    opts = require "configs.zenmode",
  },
}
