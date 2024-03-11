local M = {}

-- link to lspconfig server names:
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
-- Automatically setup by mason-lspconfig
M.lsp = {
  "lua-language-server",
  --
  "html-lsp",
  "css-lsp",
  "emmet-ls",
  "typescript-language-server",  -- use ts server plugin for extensions
  "tailwindcss-language-server", -- add linter?
  --
  "clangd",                      -- use clangd-extensions plugin for formatting
  --
  "pyright",
  --
  "taplo", -- toml lsp
  --
  "bash-language-server",
}

M.linter = {
  "eslint-lsp", -- js/ts linter lsp
}

M.formatter = {
  "shfmt",    -- shell
  "stylua",   -- lua
  "prettier", -- html, css and js
  "ruff-lsp", -- python formatter lsp
}

M.dap = {
  "codelldb", -- C
}

return M
