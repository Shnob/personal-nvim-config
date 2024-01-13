vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, {desc = "Open Netrw"})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

vim.keymap.set("n", "<leader><CR>", "ciw", {desc = "Change inside word"})

vim.keymap.set("n", "<leader>T", vim.cmd.terminal, {desc = "Open terminal"})

vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew, {desc = "New tab"})
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn, {desc = "Next tab"})
vim.keymap.set("n", "<leader>tp", vim.cmd.tabp, {desc = "Prev tab"})
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, {desc = "Close tab"})

vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>");

vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>", {desc = "Clear search"})
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", {desc = "Clear search"})

vim.keymap.set("n", "<leader>s", "<cmd>set spell!<CR>", {desc = "Toggle spell check"})
