local wk = require("which-key")
wk.register({
 ["."] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["/"] = { "<cmd>Telescope live_grep<cr>", "Search File" },
  f = {
    name = "file", -- optional group name
    p = { "<cmd>Telescope live_grep<cr>", "Search File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },
  b = {
    name = "buffer",
    ["["] = { "<cmd>bp<cr>", "Previous buffer" },
    ["]"] = { "<cmd>bn<cr>", "Next buffer" },
    i = { "<cmd>Telescope buffers<cr>", "All buffers" },
  },
  w = {
    name = "window",
    v = { "<c-w>v", "Vertically split windows" },
  }
}, { prefix = "<leader>" })
