return {
  "MrCapivaro/live-server.nvim",
  ft = { "html", "css", "javascript", "typescript" },
  cmd = { "LiveServerStart", "LiveServerStop" },
  keys = {
    {
      "<A-l><A-o>",
      "<cmd>LiveServerStart<cr>",
      desc = "Open Live Server",
    },
    {
      "<A-l><A-c>",
      "<cmd>LiveServerStop<cr>",
      desc = "Open Live Server",
    },
  },
  opts = {
    -- windows = true,
    args = {
      "--browser=wslview",
    },
  },
}
