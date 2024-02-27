return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Open the Mason menu." },
    },
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",
        -- web dev --
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "typescript-language-server", -- use ts server plugin for extensions
        "tailwindcss-language-server", -- add linter?
        "prettier",
        "eslint-lsp",
        -- c & c++ --
        "clangd", -- use clangd-extensions plugin for formatting
        "codelldb",
        -- python --
        "pyright",
        "ruff-lsp",
        -- go --
        -- rust --
        -- nix? --
        -- other --
        "taplo",
        "bash-language-server",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        require("util.mason").installServers(opts.ensure_installed)
      end, {})
    end,
  },

  { "folke/neodev.nvim", opts = {} },

  {
    -- link to lspconfig server names:
    -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "nvim-lspconfig",
      "mason.nvim",
      "neodev.nvim",
    },
    opts = function()
      local lspconfig = require("lspconfig")
      return {
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
          -- ["clangd"] = function()
          --   lspconfig.clangd.setup({
          --     cmd = { "clangd", "-offset-encoding=utf-8" },
          --   })
          -- end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  workspace = { checkThirdParty = false },
                },
              },
            })
          end,
        },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason.nvim" },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }
          local map = vim.keymap.set
          map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
          map({ "n", "x" }, "<leader>fm", function()
            vim.lsp.buf.format({ async = false })
          end, opts)
          map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
          map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
          map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
        end,
      })
    end,
  },
}
