local Util = require("config.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Yank to localhost:8378
map("n", "<leader>Y", "<cmd>call system('nc -w 1 0.0.0.0 8378', @0)<cr>")

-- Move cursor by displayed line when wrapping
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear highlight
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map({ "i", "n" }, "<leader>/", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Use arrow key for resize
map("n", "<left>", "<cmd>vertical resize +2<cr>")
map("n", "<right>", "<cmd>vertical resize +2<cr>")
map("n", "<up>", "<cmd>resize +2<cr>")
map("n", "<left>", "<cmd>resize +2<cr>")

-- Move lines
map("n", "<C-S-j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<C-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<C-S-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<C-S-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<C-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<C-S-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

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

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- lazygit
map("n", "<leader>g", function() Util.float_term({ "lazygit" }, {}) end, { desc = "Lazygit" })

-- Insert new line with enter without going to insert mode
map("n", "<leader><cr>", "<cmd>a<cr><cr>.<cr>")

-- Save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "W", "<cmd>w<cr>")
-- Quit file
map("n", "<C-q>", "<cmd>q<cr><esc>", { desc = "Quit" })
map("n", "Q", "<cmd>q<cr>")
