return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          disabled_filetypes = { "html" },
        }),
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2" }
        })
      },
    })
  end,
}
