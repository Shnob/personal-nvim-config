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

        { 'weilbith/nvim-code-action-menu' },

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
        { "Freedzone/kerbovim" },
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        local lspconfig = require('lspconfig')

        require('lspconfig.configs').kos_lsp = {
            default_config = {
                cmd = { "kls" },
                filetypes = { 'kerboscript' },
                single_file_support = true,
                settings = {},
            },
        }

        lspconfig.kos_lsp.setup({
            cmd = { "kls" },
        })

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
                    -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
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

        lspconfig.bashls.setup {
            single_file_support = true,
        }

        -- Customization for Pmenu
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
        vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

        vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
        vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
        vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

        vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#D3E8DD", bg = "#9FBD73" })
        vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#D3E8DD", bg = "#9FBD73" })
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#D3E8DD", bg = "#9FBD73" })

        vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFFFE8", bg = "#D4BB6C" })
        vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFFFE8", bg = "#D4BB6C" })
        vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFFFE8", bg = "#D4BB6C" })

        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
        vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
        vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
        vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
        vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
        vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

        vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5F5F5", bg = "#D4A959" })
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5F5F5", bg = "#D4A959" })
        vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5F5F5", bg = "#D4A959" })

        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
        vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
        vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

        vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
        vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
        vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
    end
}
