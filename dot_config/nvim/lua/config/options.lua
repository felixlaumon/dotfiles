vim.g.mapleader = ","
vim.g.autoformat = false
-- vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_lsp = "pyright"

local opt = vim.opt

opt.autoread = true
opt.autowrite = true
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 10 -- Lines of context

-- opt.mouse = ""
opt.clipboard = ""

opt.splitkeep = "cursor"
