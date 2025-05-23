return {
    "hedyhli/outline.nvim",
    opts = {
        outline_window = {
            width = 40,
            relative_width = false,
        },
        symbols = {
            icon_source = 'lspkind',
        },
        keymaps = {
            goto_location = '<S-Cr>',
            goto_and_close = '<Cr>',
        },
    },
    keys = {
        { '<leader>o', "<cmd>Outline<cr>", {desc = "Toggle outline"} },
    },
}
