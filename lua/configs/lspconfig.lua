require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "eslint-lsp", "prettier", }
vim.lsp.enable(servers)
