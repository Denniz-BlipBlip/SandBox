return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c", "cpp", "java", "html", "javascript",
        "css", "python", "ruby", "php", "typescript",
        "json", "bash", "lua", "gdscript", "c_sharp"
      },
      indent = { enable = true },
      highlight = { enable = true },
    },
  },
  { "KSHMR1337/pinkfusion", lazy = false },
}
