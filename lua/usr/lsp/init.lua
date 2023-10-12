local lsp_status, _ = pcall(require, "lspconfig")
if not lsp_status then
    print("LSP Not Found")
  return
end

require("usr.lsp.mason")
require("usr.lsp.handlers").setup()
require("usr.lsp.null-ls")