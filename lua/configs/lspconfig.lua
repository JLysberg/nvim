require("nvchad.configs.lspconfig").defaults()

local servers = {
  terraformls = {},
  csharpier = {},
  ruff = {},
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          ignore = { "*" },
        },
      },
    },
  },
  omnisharp = {
    cmd = {
      "omnisharp",
      "-z",
      "--languageserver",
      "DotNet:enablePackageRestore=false",
      "--encoding",
      "utf-8",
      "--hostPID",
      tostring(vim.fn.getpid()),
    },

    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = false,
      },
      RoslynExtensionsOptions = {
        EnableAnalyzersSupport = nil,
        EnableImportCompletion = nil,
        AnalyzeOpenDocumentsOnly = nil,
      },
      Sdk = {
        IncludePrereleases = true,
      },
    },
  },
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
  },
  tailwindcss = {
    filetypes = { "html", "svelte" },
    init_options = {
      userLanguages = {
        svelte = "html",
      },
    },
  },
  prismals = {
    filetypes = { "prisma" },
  },
  svelte = {
    on_attach = function(client, bufnr)
      if client.name == "svelte" then
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts", "*.svelte" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
          end,
        })
      end
      if vim.bo[bufnr].filetype == "svelte" then
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts", "*.svelte" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
          end,
        })
      end

      vim.api.nvim_buf_create_user_command(bufnr, "LspMigrateToSvelte5", function()
        client:exec_cmd {
          command = "migrate_to_svelte_5",
          arguments = { vim.uri_from_bufnr(bufnr) },
        }
      end, { desc = "Migrate Component to Svelte 5 Syntax" })
    end,
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end
