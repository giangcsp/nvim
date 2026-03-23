vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.guicursor = ""
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.hlsearch = false
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 200
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.isfname:append("@-@")

vim.diagnostic.config({
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  virtual_text = false,
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
})
