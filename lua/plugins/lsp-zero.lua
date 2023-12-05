return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = true,
    event = { 'VeryLazy' },
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                { 'onsails/lspkind.nvim' },
            },
        },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },

        { 'nvim-lua/lsp-status.nvim' },

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

        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
            },
            window = {
                completion = {
                    --winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    col_offset = -3,
                    side_padding = 0,
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind")
                        .cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"

                    return kind
                end,
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
