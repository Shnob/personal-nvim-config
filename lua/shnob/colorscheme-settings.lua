local field_property_event = "#B5585F"
local text_enum_keyword = "#9FBD73"
local constant_constructor_reference = "#D4BB6C"
local function_struct_class_module_operator = "#A377BF"
local variable_file = "#7E8294"
local unit_snippet_folder = "#D4A959"
local method_value_member = "#6C8ED4"
local interface_color_typeparameter = "#58B5A8"

vim.g.set_extra_colorscheme_settings_transparent = function()
    vim.cmd [[
        hi Folded ctermbg=NONE guibg=NONE
        hi NormalFloat ctermbg=NONE guibg=NONE
        hi FloatBorder ctermbg=NONE guibg=NONE
        hi TelescopeNormal ctermbg=NONE guibg=NONE
        hi TelescopeBorder ctermbg=NONE guibg=NONE
        hi TelescopePromptBorder ctermbg=NONE guibg=NONE
        hi TelescopePromptTitle ctermbg=NONE guibg=NONE
        hi NotifyBackground ctermbg=NONE guibg=NONE
        hi NotifyERRORBody ctermbg=NONE guibg=NONE
        hi NotifyWARNBody ctermbg=NONE guibg=NONE
        hi NotifyINFOBody ctermbg=NONE guibg=NONE
        hi NotifyDEBUGBody ctermbg=NONE guibg=NONE
        hi NotifyTRACEBody ctermbg=NONE guibg=NONE
        hi NotifyERRORBorder ctermbg=NONE guibg=NONE
        hi NotifyWARNBorder ctermbg=NONE guibg=NONE
        hi NotifyINFOBorder ctermbg=NONE guibg=NONE
        hi NotifyDEBUGBorder ctermbg=NONE guibg=NONE
        hi NotifyTRACEBorder ctermbg=NONE guibg=NONE
        hi TreeSitterContext ctermbg=NONE guibg=NONE
        hi WinSeparator ctermbg=NONE guibg=NONE
        hi DiagnosticVirtualTextError ctermbg=NONE guibg=NONE
        hi DiagnosticVirtualTextWarn ctermbg=NONE guibg=NONE
        hi DiagnosticVirtualTextInfo ctermbg=NONE guibg=NONE
        hi DiagnosticVirtualTextHint ctermbg=NONE guibg=NONE
        hi TabLine ctermbg=NONE guibg=NONE
        hi TabLineFill ctermbg=NONE guibg=NONE
        hi TabLineSel ctermbg=NONE guibg=NONE
        hi FloatTitle ctermbg=NONE guibg=NONE
        hi NormalSB ctermbg=NONE guibg=NONE
    ]]

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

    -- Diff stuff
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = "#103a2a" })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#333333", bg = "#111111" })
end

vim.g.set_extra_colorscheme_settings_all = function()
    vim.cmd [[
        hi! link TreeSitterContextSeparator LineNr
    ]]
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        if type(vim.g.transparent_enabled) == "boolean"
            and vim.g.transparent_enabled then
            vim.g.set_extra_colorscheme_settings_transparent()
        end
        vim.g.set_extra_colorscheme_settings_all()
    end
})
