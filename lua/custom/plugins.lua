local plugins = {
  {
    "ThePrimeagen/harpoon",

    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      local overrides = require "custom.configs.nvim-treesitter"

      opts.ensure_installed = overrides.ensure_installed
      opts.highlight = overrides.highlight
      opts.indent = overrides.indent
      opts.incremental_selection = overrides.incremental_selection
      opts.textobjects = overrides.textobjects

      return opts
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",

        -- python
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",

        -- csharp
        "csharpier",
        -- csharp-ls installed via dotnet

        -- sql
        "sql-formatter",

        -- proto
        "buf",
        "buf-language-server",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "sql", "cs", "proto"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sort_by = 'case_sensitive',
      view = {
        adaptive_size = true,
      },
      filters = {
        dotfiles = true
      },
      open_on_tab = true,
      sync_root_with_cwd = false,
      git = {
        enable = true,
      },
      renderer = {
        root_folder_label = true,
        group_empty = true,

        indent_markers = {
          enable = true
        },

        icons = {
          show = {
            git = true
          }
        }
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "plugins.configs.cmp"
      local overrides = require "custom.configs.cmp"

      opts.completion = overrides.completion
      opts.mapping = overrides.mapping

      return opts
    end,
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          enabled = true,
          laststatus = 0, -- turn off the statusline in zen mode
        },
      },
    }
  }
}

return plugins
