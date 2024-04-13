local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { "folke/lazy.nvim", enabled = false },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "sam4llis/nvim-tundra"
})
