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
    },
    keys = {
        { '<leader>o', "<cmd>Outline<cr>", {desc = "Toggle outline"} },
    },
}
