local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local util = require "lspconfig/util"

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
  client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  filetypes = {"c","cpp", "c++"},
  capabilites = capabilities,
}

-- lspconfig.tsserver.setup {
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

lspconfig.html.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = on_attach,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.tailwindcss.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

--lspconfig.rust_analyzer.setup({
--  on_attach = on_attach,
--  capabilites = capabilities,
--  filetypes = {"rust"},
--  root_dir = util.root_pattern("Cargo.toml"),
--  settings = {
--    ['rust-analyzer'] = {
--      cargo = {
--        allFeatures = true,
--      },
--    },
--  },
--})
