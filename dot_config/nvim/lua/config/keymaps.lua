-- Yank to localhost:8378
vim.keymap.set("n", "<leader>Y", "<cmd>call system('nc -w 1 0.0.0.0 8378', @0)<cr>")

-- Move cursor by displayed line when wrapping
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("n", "j", "gj", { silent = true })

-- Clear highlight
vim.keymap.set("n", "<leader>/", "<cmd>nohls<cr>", { silent = true })

-- Disable arrow keys
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")

-- Use ctrl-arrow key for resize
vim.keymap.set("n", "<c-left>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<c-right>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<c-up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<c-left>", "<cmd>resize +2<cr>")

-- Split
vim.keymap.set("n", "<leader>v", "<c-w>v<c-w>l")
vim.keymap.set("n", "<leader>h", "<c-w>s<c-w>j")

-- Center search
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{}", "{zz")

-- Insert new line with enter without going to insert mode
vim.keymap.set("n", "<leader><cr>", "<cmd>a<cr><cr>.<cr>")

-- W for :w and Q for :q
vim.keymap.set("n", "W", "<cmd>w<cr>")
vim.keymap.set("n", "Q", "<cmd>q<cr>")
