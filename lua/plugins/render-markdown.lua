return {
    'MeanderingProgrammer/render-markdown.nvim',
    main = "render-markdown",
    opts = {
        sign = {
            enabled = false,
        },
        heading = {
            backgrounds = { "none", "none", "none", "none", "none", "none", },
        },
        code = {
            highlight = "none",
            highlight_inline = "none",
            highlight_border = "none",
            border = 'thick',
        }
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}
