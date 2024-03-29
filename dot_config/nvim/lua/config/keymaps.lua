local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Yank to localhost:8378
map("n", "<leader>Y", "<cmd>call system('nc -w 1 0.0.0.0 8378', @0)<cr>", { desc = "Yank to Remote" })

-- Clear highlight
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map({ "i", "n" }, "<leader>/", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Move lines
map("n", "<C-S-j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<C-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<C-S-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<C-S-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<C-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<C-S-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Unmap default move lines
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

-- Split
map("n", "<leader>v", "<c-w>v<c-w>l")
map("n", "<leader>h", "<c-w>s<c-w>j")

-- Center search
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "}", "}zz")
map("n", "{}", "{zz")

-- Do not jump to next occurence
map("n", "*", "*``")
map("n", "#", "#``")

-- Insert new line with enter without going to insert mode
map("n", "<leader><cr>", "<cmd>a<cr><cr>.<cr>")

-- Save
map("n", "W", "<cmd>w<cr>")

-- Quit
map("n", "Q", "<cmd>qa<cr>")
