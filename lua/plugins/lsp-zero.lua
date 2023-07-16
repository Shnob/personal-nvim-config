return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = true,
    cmd = 'LspInfo',
    event = { 'VeryLazy' },
    --ft = {"lua", "rust", "c", "cpp", "java", "python"},
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { {
            'neovim/nvim-lspconfig',
            config = function()
                local lspconfig = require('lspconfig')
                lspconfig.clangd.setup {
                }
            end
        } }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')

        lsp.ensure_installed({
        })

        lsp.set_sign_icons({
            error = "",
            warn = "",
            hint = "󰈾",
            info = "",
        })

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
        })


        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: hover" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: goto definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: goto declaration" })
        vim.keymap.set("n", "gm", vim.lsp.buf.implementation, { desc = "LSP: goto implementation" })
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "LSP: goto type definition" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: goto references" })
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "LSP: signature help" })
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP: rename" })
        vim.keymap.set("n", "<F3>", vim.lsp.buf.format, { desc = "LSP: format" })
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "LSP: code action" })
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Diag: open float" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diag: goto prev" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diag: goto next" })
    end
}
