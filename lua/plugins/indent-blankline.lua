return
{
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    main = 'ibl',
    opts = {
        indent = { char = "▏" }, -- ┆ ▏
    }
}
