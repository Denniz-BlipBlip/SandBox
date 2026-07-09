local capabilities = vim.lsp.protocol.make_client_capabilities()

-- HTML
vim.lsp.config("html", {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
})

-- CSS
vim.lsp.config("cssls", {
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
})

-- PHP
vim.lsp.config("intelephense", {
  capabilities = capabilities,
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
})

-- Python
vim.lsp.config("pylsp", {
  capabilities = capabilities,
  filetypes = { "python" },
})

-- Ruby
vim.lsp.config("solargraph", {
  capabilities = capabilities,
  filetypes = { "ruby" },
})

-- C/C++
vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
})

vim.lsp.enable({
  "html", "cssls", "ts_ls", "intelephense",
  "pylsp", "solargraph", "clangd"
})
