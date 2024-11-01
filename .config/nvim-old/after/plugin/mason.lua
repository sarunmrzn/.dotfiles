require("mason").setup({
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "tailwindcss",
  },
  automatic_installation = true,
})
