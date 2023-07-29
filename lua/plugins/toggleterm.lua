return {
    'akinsho/toggleterm.nvim',

    keys = {
        {[[<C-\>]]},
    },

    config = function()
        --Set_custom_powershell_options()

        local toggleterm = require("toggleterm")
        toggleterm.setup({
            open_mapping = [[<C-\>]],
            start_in_insert = true,
            direction = "float",
            float_opts = {
                border = "curved",
                --width = math.ceil(vim.o.columns * 0.5),
                --height = math.ceil(vim.o.columns * 0.15)
            },
        })
    end
}
