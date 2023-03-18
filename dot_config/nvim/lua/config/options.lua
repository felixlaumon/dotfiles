local opt = vim.opt

-- Tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Ignore
opt.wildignore = {
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
opt.modelines = 1
opt.mouse = ""
opt.spelllang = { "en" }
opt.wrap = false
opt.number = true
opt.numberwidth = 4
opt.cursorline = true
opt.ruler = true
opt.textwidth = 120
opt.colorcolumn = "+1"
opt.autoread = true
opt.autowrite = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.termguicolors = true
opt.signcolumn = "yes"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3
opt.grepprg = "rg --vimgrep"
opt.laststatus = 0
opt.pumblend = 10
opt.pumheight = 10
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 300
opt.wildmode = "longest:full,full"
opt.updatetime = 200
opt.winminwidth = 5

-- Highlight
opt.incsearch = true
opt.inccommand = "nosplit"
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Spellcheck
opt.spell = true
--- TODO: how to do hi clear in lua?
vim.api.nvim_command "hi clear SpellBad"
vim.api.nvim_command "hi clear SpellCap"
vim.api.nvim_command "hi clear SpellRare"
vim.api.nvim_command "hi SpellBad cterm=underline"

-- Replace all occurrences by default
opt.gdefault = true

-- Undo and backup
opt.undofile = true
opt.undodir = os.getenv "HOME" .. "/.nvim/tmp/undo"
opt.backup = true
opt.backupdir = os.getenv "HOME" .. "/.nvim/tmp/backup"
opt.swapfile = false

vim.g.markdown_recommended_style = 0
