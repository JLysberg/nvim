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
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end
