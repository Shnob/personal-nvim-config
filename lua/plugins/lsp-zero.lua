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
        local lspkind = require('lspkind')

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

        lsp_zero.on_attach(function(_, bufnr)
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
            mapping = cmp.mapping.preset.insert({
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
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.close(),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
            },
            window = {
                completion = cmp.config.window.bordered({
                    scrollbar = false,
                    col_offset = -1,
                }),
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind")
                        .cmp_format({ mode = "symbol", maxwidth = 30 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = (strings[1] or "")
                    -- kind.menu = "    (" .. (strings[2] or "") .. ")"

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

        lspconfig.jdtls.setup {
            settings = {
                java = {
                    project = {
                        referencedLibraries = {
                            '/home/jake/Code/java/krpc_2/app/lib/krpc-java-0.5.2.jar',
                        },
                    },
                },
            },
        }

        lspkind.init({
            symbol_map = {
                Constructor = '󱌣',
                TypeParameter = '',
            }
        })

        local field_property_event = "#B5585F"
        local text_enum_keyword = "#9FBD73"
        local constant_constructor_reference = "#D4BB6C"
        local function_struct_class_module_operator = "#A377BF"
        local variable_file = "#7E8294"
        local unit_snippet_folder = "#D4A959"
        local method_value_member = "#6C8ED4"
        local interface_color_typeparameter = "#58B5A8"

        -- Customization for Pmenu
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
        vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

        vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = field_property_event, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = field_property_event, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = field_property_event, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = text_enum_keyword, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = text_enum_keyword, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = text_enum_keyword, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = constant_constructor_reference, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = constant_constructor_reference, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = constant_constructor_reference, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = function_struct_class_module_operator, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = function_struct_class_module_operator, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = function_struct_class_module_operator, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = function_struct_class_module_operator, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = function_struct_class_module_operator, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = variable_file, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = variable_file, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = unit_snippet_folder, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = unit_snippet_folder, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = unit_snippet_folder, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = method_value_member, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = method_value_member, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = method_value_member, bg = "NONE" })

        vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = interface_color_typeparameter, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = interface_color_typeparameter, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = interface_color_typeparameter, bg = "NONE" })
    end
}
