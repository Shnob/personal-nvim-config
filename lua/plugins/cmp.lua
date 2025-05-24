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
                format = function(entry, vim_item)
                    local kind = lspkind.cmp_format({ mode = "symbol", maxwidth = 30 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = (strings[1] or "")
                    -- kind.menu = "    (" .. (strings[2] or "") .. ")"
                    kind.menu = ""

                    return kind
                end,
            },
        })
    end,
}
