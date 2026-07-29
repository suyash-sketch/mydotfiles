require("nvchad.configs.lspconfig").defaults()


vim.lsp.config("html", {})
vim.lsp.config("cssls", {})
vim.lsp.config("pyrefly", {})
vim.lsp.config("ruff", {})
vim.lsp.config("tailwindcss", {})
vim.lsp.config("eslint", {})
vim.lsp.config("vtsls", {})
local servers = { "html", "cssls", "pyrefly", "ruff","tailwindcss", "eslint", "vtsls"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
