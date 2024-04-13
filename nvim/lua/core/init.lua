vim.wo.number = true
vim.o.expandtab = true
vim.o.shiftwidth= 2
vim.g.mapleader = " "

require('core.lazy')
require('core.which-key')

vim.cmd("colorscheme kanagawa-dragon")
