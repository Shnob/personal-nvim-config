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
    end,
}
