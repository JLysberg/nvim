require("nvchad.configs.lspconfig").defaults()

local servers = {
  terraformls = {},
  csharpier = {},
  ruff = {
    logLevel = "info",
  },
  pyright = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
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
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end

-- require("lspconfig").svelte.setup {
--   filetypes = { "svelte" },
--   on_attach = function(client, bufnr)
--     if client.name == "svelte" then
--       vim.api.nvim_create_autocmd("BufWritePost", {
--         pattern = { "*.js", "*.ts", "*.svelte" },
--         callback = function(ctx)
--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
--         end,
--       })
--     end
--     if vim.bo[bufnr].filetype == "svelte" then
--       vim.api.nvim_create_autocmd("BufWritePost", {
--         pattern = { "*.js", "*.ts", "*.svelte" },
--         callback = function(ctx)
--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
--         end,
--       })
--     end
--   end,
--   capabilities = nvlsp.capabilities,
-- }
