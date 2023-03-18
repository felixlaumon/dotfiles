local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = {
    "xml",
    "html",
    "css",
    "javascript",
    "typescript",
    "yaml",
    "lua",
    "json",
    "sql",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- When editing a file, always jump to the last known cursor position.
-- Don't do it for commit messages, when the position is invalid, or when
-- inside an event handler (happens when dropping a file on gvim).
vim.api.nvim_exec(
  [[
autocmd BufReadPost *
\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
]],
  true
)
