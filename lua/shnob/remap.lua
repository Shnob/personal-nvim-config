vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, {desc = "Open Netrw"})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

vim.keymap.set("t", "<C-/>", "<C-\\><C-n>");

vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>", {desc = "Clear search"})
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", {desc = "Clear search"})

vim.keymap.set("n", "<leader>s", "<cmd>set spell!<CR>", {desc = "Toggle spell check"})

vim.keymap.set("i", "jk", "<esc>", {desc = "jk to escape"})

vim.keymap.set("n", "<C-h>", "<cmd>Copilot disable<CR>", {desc = "Copilot: Disable"})
vim.keymap.set("i", "<C-h>", "<cmd>Copilot disable<CR>", {desc = "Copilot: Disable"})
