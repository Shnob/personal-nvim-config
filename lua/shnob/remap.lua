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

-- LSP keymaps
vim.keymap.set("n", "K",
    function()
        vim.lsp.buf.hover({
            border = 'rounded',
        })
    end,
    { desc = "vim.lsp.buf.hover()" }
)

vim.keymap.set("n", "gl",
    function()
        vim.diagnostic.open_float(nil, {})
    end,
    { desc = "vim.diagnostic.open_float()" }
)

vim.keymap.set("n", "grd",
    function()
        vim.lsp.buf.definition({})
    end,
    { desc = "vim.lsp.buf.definition()" }
)

vim.keymap.set("n", "gri",
    function()
        vim.lsp.buf.implementation({})
    end,
    { desc = "vim.lsp.buf.implementation()" }
)

vim.keymap.set("n", "grD",
    function()
        vim.lsp.buf.declaration({})
    end,
    { desc = "vim.lsp.buf.declaration()" }
)

vim.keymap.set("n", "gro",
    function()
        vim.lsp.buf.type_definition({})
    end,
    { desc = "vim.lsp.buf.type_definition()" }
)

vim.keymap.set("n", "grs",
    function()
        vim.lsp.buf.signature_help({
            border = 'rounded',
        })
    end,
    { desc = "vim.lsp.buf.signature_help()" }
)

vim.keymap.set("i", "<C-s>",
    function()
        vim.lsp.buf.signature_help({
            border = 'rounded',
        })
    end,
    { desc = "vim.lsp.buf.signature_help()" }
)
