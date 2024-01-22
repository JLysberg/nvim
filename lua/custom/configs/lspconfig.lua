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

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) }
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    disableSuggestions = true,
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
})

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
