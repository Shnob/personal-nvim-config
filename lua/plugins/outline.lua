return {
    "hedyhli/outline.nvim",
    opts = {
        outline_window = {
            width = 50,
            relative_width = false,
        },
    },
    keys = {
        { '<leader>o', "<cmd>Outline<cr>", {desc = "Toggle outline"} },
    },
}
