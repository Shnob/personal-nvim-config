return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio'
    },
    keys = {
        {
            '<leader>du',
            function() require 'dapui'.toggle() end,
            desc = "Dapui: Toggle UI",
        },
    },
    opts = {
    },
}
