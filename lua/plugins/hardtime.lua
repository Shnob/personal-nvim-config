return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
        restricted_keys = {
            ["<Left>"] = { "n", "x" },
            ["<Right>"] = { "n", "x" },
        },
        disabled_keys = {
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
        },
        disabled_filetypes = {
            "Outline",
            "netrw",
            "harpoon",
            "mason",
            "markdown",
            "help",
            "undotree",
            "lazy",
        },
    },
}
