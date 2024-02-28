return {
    "b0o/incline.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local incline = require("incline")

        incline.setup({
            render = function(props)
                local devicons = require('nvim-web-devicons')
                local helpers = require('incline.helpers')

                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                local ft_icon, ft_color = devicons.get_icon_color(filename)
                local modified = vim.bo[props.buf].modified
                return {
                    ft_icon and { ' ', ft_icon, ' ', guibg = 'NONE', guifg = props.focused and ft_color or '#777777' } or
                    '',
                    filename,
                    modified and { ' *', guifg = '#888888', gui = 'bold' } or '',
                    ' ',
                    guibg = 'NONE',
                    guifg = props.focused and '#c678dd' or '#777777',
                }
            end
        })
    end,
}
