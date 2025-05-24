-- Contains not only cmp, but all cmp-related plugins
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        local lspkind = require 'lspkind'

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

        lspkind.init({
            symbol_map = {
                Constructor = '󱌣',
                TypeParameter = '',
                Variable = '𝒙',
            }
        })

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
            mapping = cmp.mapping.preset.insert {
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-n>'] = function()
                    if cmp.visible() then
                        cmp.select_next_item({
                            behavior =
                                cmp.SelectBehavior.Select
                        })
                    else
                        cmp.complete()
                    end
                end,
                ['<C-p>'] = function()
                    if cmp.visible() then
                        cmp.select_prev_item({
                            behavior =
                                cmp.SelectBehavior.Select
                        })
                    else
                        cmp.complete()
                    end
                end,
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.close(),
            },
            window = {
                completion = cmp.config.window.bordered({
                    scrollbar = false,
                    col_offset = -1,
                }),
                documentation = cmp.config.window.bordered({
                    scrollbar = false,
                }),
            },
            formatting = {
                fields = { "abbr", "kind" },
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50, -- leading text (labelDetails)
                        abbr = function() return math.floor(math.min(80, 0.45 * vim.o.columns)) end, -- actual suggestion item
                    },
                    ellipsis_char = '⋯', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        return vim_item
                    end
                })
            },
        })
    end,
}
