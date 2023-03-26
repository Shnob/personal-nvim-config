
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "nzz")

vim.keymap.set("n", "<leader>T", vim.cmd.terminal)

vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabp)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
