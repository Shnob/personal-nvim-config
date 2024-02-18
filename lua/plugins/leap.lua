return {
    "ggandor/leap.nvim",
    config = function()
        local leap = require('leap')

        -- Disable autojump
        leap.opts.safe_labels = {}

        leap.create_default_mappings()

        vim.cmd([[
            autocmd ColorScheme * hi! LeapLabelPrimary guifg=#000000 guibg=#fff933
            autocmd ColorScheme * hi! LeapLabelSecondary guifg=#000000 guibg=#ff4444
        ]])
    end,
}
