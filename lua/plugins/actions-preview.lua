return {
    'aznhe21/actions-preview.nvim',
    lazy = true,
    keys = {
        {
            'gra', function() require 'actions-preview'.code_actions() end, desc = 'Lsp: Actions preview'
        },
    },
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        backend = { 'telescope' },
    },
}
