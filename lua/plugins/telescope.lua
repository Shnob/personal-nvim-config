return
{
    'nvim-telescope/telescope.nvim',
    lazy = true,
    tag = '0.1.2',
    cmd = { "Telescope" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', "<cmd>Telescope find_files<cr>",          { desc = "Tele: find files" } },
        { '<leader>fj', "<cmd>Telescope git_files<cr>",           { desc = "Tele: git files" } },
        { '<leader>fr', "<cmd>Telescope lsp_references<cr>",      { desc = "Tele: Lsp references" } },
        { '<leader>fd', "<cmd>Telescope lsp_definitions<cr>",     { desc = "Tele: Lsp definitions" } },
        { '<leader>fm', "<cmd>Telescope lsp_implementations<cr>", { desc = "Tele: Lsp implementations" } },
        { '<leader>fl', "<cmd>Telescope diagnostics<cr>",         { desc = "Tele: Lsp diagnostics" } },
        { '<leader>fk', "<cmd>Telescope buffers<cr>",             { desc = "Tele: buffers" } },
        { '<leader>fc', "<cmd>Telescope colorscheme<cr>",         { desc = "Tele: colorscheme" } },
        { '<leader>fz', "<cmd>Telescope spell_suggest<cr>",       { desc = "Tele: colorscheme" } },
    },
    opts = {
        defaults = {
            prompt_prefix = " ➝ ",
            selection_caret = " ➝ ",
            entry_prefix = "   ",
        },
    },
    --
    --    config = function ()
    --        require('telescope').load_extension('noice')
    --    end,
}
