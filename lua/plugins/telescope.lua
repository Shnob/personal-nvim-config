return
{
    'nvim-telescope/telescope.nvim',
    lazy = true,
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', "<cmd>Telescope find_files<cr>", { desc = "Tele: find files" } },
        { '<leader>fg', "<cmd>Telescope git_files<cr>",  { desc = "Tele: git files" } },
    }
}
