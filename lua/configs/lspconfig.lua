require("nvchad.configs.lspconfig").defaults()

local servers = {
  pyright = {
    -- settings = {
    --   python = {
    --     analysis = {
    --       autoSearchPaths = true,
    --       typeCheckingMode = "basic",
    --     },
    --   },
    -- },
  },
  terraformls = {},
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end
