local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

require'lspconfig'.rust_analyzer.setup{
  settings = {
    filetypes = "rust",
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      },
      cargo = {
        allFeatures = true
      }
    }
  }
}
lspconfig.tsserver.setup {}
lspconfig.html.setup{}
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
lspconfig.sqlls.setup{}
require'lspconfig'.arduino_language_server.setup{}
