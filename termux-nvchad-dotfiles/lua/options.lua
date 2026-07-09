-- File Path: ~/.config/nvim/lua/options.lua

require "nvchad.options"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.env.DISPLAY = ":0"

-- Auto indent for all filetypes
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = false

-- Filetype specific indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "php", "javascript", "typescript", "json" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
  end,
})
