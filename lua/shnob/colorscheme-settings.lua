vim.g.set_extra_colorscheme_settings_transparent = function()
    vim.cmd [[
        hi Folded ctermbg=NONE guibg=NONE
        hi NormalFloat ctermbg=NONE guibg=NONE
        hi FloatBorder ctermbg=NONE guibg=NONE
        hi TelescopeNormal ctermbg=NONE guibg=NONE
        hi TelescopeBorder ctermbg=NONE guibg=NONE
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
