return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = true,
    event = { 'VeryLazy' },
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },         -- Required
        { 'hrsh7th/cmp-nvim-lsp' },     -- Required
        { 'hrsh7th/cmp-buffer' },       -- Optional
        { 'hrsh7th/cmp-path' },         -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' },     -- Optional

        { 'nvim-lua/lsp-status.nvim' }, -- Optional

        -- Snippets
        {
            'L3MON4D3/LuaSnip',
            dependencies = { { 'rafamadriz/friendly-snippets' } },
            config = function()
                local luasnip = require('luasnip')
                luasnip.setup({})
                require("luasnip.loaders.from_vscode").lazy_load()

                vim.keymap.set({ 's', 'i' }, '<A-l>', function()
                        if luasnip.jumpable(1) then luasnip.jump(1) end
                    end,
                    { desc = 'LuaSnip: Next Placeholder' })
                vim.keymap.set({ 's', 'i' }, '<A-h>', function()
                        if luasnip.jumpable(-1) then luasnip.jump(-1) end
                    end,
                    { desc = 'LuaSnip: Prev Placeholder' })
            end
        },
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        local lspconfig = require('lspconfig')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls' },
            handlers = {
                lsp_zero.default_setup,
            },
        })

        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "󰌶",
            info = "",
        })

        lspconfig.clangd.setup {
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            }
        }
    end
}
