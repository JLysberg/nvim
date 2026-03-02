return {
  ------------ default reconfigurations ------------

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

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = require "configs.treesitter_context",
    lazy = false,
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
    opts = require "configs.mason",
  },

  ------------ custom plugins ------------

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("configs.harpoon").setup(opts)
    end,
    opts = function()
      return require("configs.harpoon").opts
    end,
  },

  {
    "folke/zen-mode.nvim",
    opts = require "configs.zenmode",
  },

  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = require "configs.hardtime",
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
  },

  {
    "sunjon/shade.nvim",
    event = "VeryLazy",
    opts = require "configs.shade",
  },
}
