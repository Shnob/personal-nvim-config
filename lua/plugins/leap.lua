return {
    "ggandor/leap.nvim",
    lazy = false,
    keys = {
        { 's',  '<Plug>(leap-forward)',     { 'n', 'x', 'o' }, desc = 'Leap: Forward' },
        { 'S',  '<Plug>(leap-backward)',    { 'n', 'x', 'o' }, desc = 'Leap: Backward' },
        { 'gS', '<Plug>(leap-from-window)', { 'n', 'x', 'o' }, desc = 'Leap: From window' },
    },
    config = function()
        local leap = require('leap')

        -- Disable autojump
        leap.opts.safe_labels = {}

        vim.cmd([[
            autocmd ColorScheme * hi! LeapLabelPrimary guifg=#000000 guibg=#fff933
            autocmd ColorScheme * hi! LeapLabelSecondary guifg=#000000 guibg=#ff4444
        ]])
    end,
}
