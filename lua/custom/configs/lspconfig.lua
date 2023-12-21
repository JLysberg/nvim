local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local servers = { "pyright", "csharp_ls", "bufls", "terraformls", "sqlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- lspconfig.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"python"},
-- })
--
-- lspconfig.csharp_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"cs"},
-- })
--
-- lspconfig.bufls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"proto"},
-- })
--
-- lspconfig.terraformls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
