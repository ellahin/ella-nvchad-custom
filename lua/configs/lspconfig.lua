local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

require'lspconfig'.rust_analyzer.setup{
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    filetypes = "rust",
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      },
      cargo = {
        allFeatures = true
      },
      procMacro = {
        ignored = {
            leptos_macro = {
                "component",
                "server",
            },
        },
      },
    },
    workspaceFolders = true,
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  end,
}
lspconfig.tsserver.setup {}
lspconfig.html.setup {
  init_options = {
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  },
  provideFormatter = true
}
}
lspconfig.clangd.setup{
}
lspconfig.pyright.setup{}
lspconfig.sqlls.setup{}
require'lspconfig'.arduino_language_server.setup{}
require'lspconfig'.golangci_lint_ls.setup{}
