vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.hlsearch = true

local os = vim.loop.os_uname().sysname

if os == 'Windows_NT' then
    Set_custom_powershell_options()
    vim.opt.shell = "powershell"
end

vim.g.airline_powerline_fonts = true

-- vim.opt.cursorline = true

-- For UFO
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.netrw_banner = 0

-- Make folded lines transparent
vim.cmd [[
    highlight Folded ctermbg=NONE guibg=NONE
]]

-- Set indent width to 2 in ocaml
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ocaml",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})

--vim.cmd [[
--augroup remember_folds
--  autocmd!
--  autocmd BufWrite * mkview
--  autocmd BufRead * silent! loadview
--augroup END
--]]

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
