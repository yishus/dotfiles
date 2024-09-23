vim.wo.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.g.mapleader = " "
vim.opt.ignorecase = true
vim.opt.smartcase = true

local map = vim.keymap.set
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<tab>", "<C-w>w", { desc = "Toggle active window" })
map("i", "<C-e>", "<C-o>$", { desc = "Go to end of line" })
map("i", "<C-h>", "<C-o>_", { desc = "Go to start of line" })

require('core.lazy')
require('core.which-key')

vim.cmd("colorscheme kanagawa-dragon")
