local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = {
    'xml', 'html', 'css', 'javascript', 'typescript', 'yaml', 'lua', 'json', 'sql'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
