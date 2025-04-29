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

  ------------ custom plugins ------------

  {
    "folke/zen-mode.nvim",
    opts = require "configs.zenmode",
  },
}
