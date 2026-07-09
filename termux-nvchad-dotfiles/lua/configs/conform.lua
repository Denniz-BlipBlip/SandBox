--File Path: ~/.config/nvim/lua/configs/conform.lua

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    java = { "google-java-format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    php = { "prettier" },
    json = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
