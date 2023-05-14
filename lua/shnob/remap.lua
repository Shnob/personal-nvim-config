
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>T", vim.cmd.terminal)

vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabp)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)

vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>");

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gm", vim.lsp.buf.implementation)
vim.keymap.set("n", "go", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<F3>", vim.lsp.buf.format)
vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
