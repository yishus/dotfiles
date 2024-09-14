vim.wo.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.g.mapleader = " "
vim.opt.ignorecase = true
vim.opt.smartcase = true

local map = vim.keymap.set
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

require('core.lazy')
require('core.which-key')

vim.cmd("colorscheme kanagawa-dragon")
