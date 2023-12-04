return {
    "folke/tokyonight.nvim",
    config = function()
        vim.cmd.colorscheme("tokyonight-moon")
        -- Make folded lines transparent
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
        ]]
    end

    -- "pineapplegiant/spaceduck",
    -- config = function ()
    --     vim.cmd.colorscheme("spaceduck")
    -- end

    -- "ellisonleao/gruvbox.nvim",
    -- config = function()
    --     vim.cmd.colorscheme("gruvbox")
    -- end
}
