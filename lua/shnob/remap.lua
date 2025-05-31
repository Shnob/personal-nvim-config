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

-- Lsp keymaps
vim.keymap.set("n", "K",
    function()
        vim.lsp.buf.hover({
            border = 'rounded',
        })
    end,
    { desc = "LSP: Hover" }
)

vim.keymap.set("n", "gl",
    function()
        vim.diagnostic.open_float(nil, {})
    end,
    { desc = "LSP: Show line diagnostics" }
)

vim.keymap.set("n", "gd",
    function()
        vim.lsp.buf.definition({})
    end,
    { desc = "LSP: Go to definition" }
)

vim.keymap.set("n", "gD",
    function()
        vim.lsp.buf.declaration({})
    end,
    { desc = "LSP: Go to declaration" }
)

vim.keymap.set("n", "gi",
    function()
        vim.lsp.buf.implementation({})
    end,
    { desc = "LSP: Go to implementation" }
)

vim.keymap.set("n", "go",
    function()
        vim.lsp.buf.type_definition({})
    end,
    { desc = "LSP: Go to type definition" }
)

vim.keymap.set("n", "gs",
    function()
        vim.lsp.buf.signature_help({
            border = 'rounded',
        })
    end,
    { desc = "LSP: Signature help" }
)

vim.keymap.set("i", "<C-s>",
    function()
        vim.lsp.buf.signature_help({
            border = 'rounded',
        })
    end,
    { desc = "LSP: Signature help" }
)
