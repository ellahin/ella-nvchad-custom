local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      }
    }
  }
})

lspconfig.tsserver.setup {}
lspconfig.html.setup{}
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
lspconfig.sqlls.setup{}
require'lspconfig'.arduino_language_server.setup{}
