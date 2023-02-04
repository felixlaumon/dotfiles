-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Ignore
vim.opt.wildignore = {
  ".svn",
  "CVS",
  ".git",
  ".hg",
  "*.o",
  "*.a",
  "*.class",
  "*.mo",
  "*.la",
  "*.so",
  "*.obj",
  "*.swp",
  "*.jpg",
  "*.png",
  "*.xpm",
  "*.gif",
  ".DS_Store",
  "*.aux",
  "*.out",
  "*.toc",
  "tmp",
  "*.scssc",
  "*.pyc",
  "*.pickle",
  "*.npy",
  "*.zip",
  "*.npy",
}

-- Other settings
vim.opt.wrap = false
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.autoread = true
vim.opt.scrolloff = 10

-- Highlight
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Spellcheck
vim.opt.spell = true
--- TODO how to do hi clear in lua?
vim.api.nvim_command("hi clear SpellBad")
vim.api.nvim_command("hi clear SpellCap")
vim.api.nvim_command("hi clear SpellRare")
vim.api.nvim_command("hi SpellBad cterm=underline")

-- Replace all occurrences by default
vim.opt.gdefault = true

-- Undo and backup
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/tmp/undo"
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/tmp/backup"
vim.opt.swapfile = false
