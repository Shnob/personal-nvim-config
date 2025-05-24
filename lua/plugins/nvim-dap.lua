return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'jay-babu/mason-nvim-dap.nvim',
            dependencies = {
                'mason-org/mason.nvim',
            },
            config = function()
                require 'mason-nvim-dap'.setup {
                    -- This line is essential to making automatic installation work
                    -- :exploding-brain
                    handlers = {},
                    automatic_installation = true,
                }
            end,
        },
    },
    keys = {
        {
            '<leader>db',
            function () require'dap'.toggle_breakpoint() end,
            desc = "Dap: Breakpoint",
        },
        {
            '<leader>dB',
            function () require'dap'.set_breakpoint() end,
            desc = "Dap: Breakpoint",
        },
        {
            '<leader>dc',
            function () require'dap'.continue() end,
            desc = "Dap: Continue",
        },
        {
            '<leader>dC',
            function () require'dap'.run_to_cursor() end,
            desc = "Dap: Run to cursor",
        },
        {
            '<leader>dT',
            function () require'dap'.terminate() end,
            desc = "Dap: Terminate",
        },
        {
            '<leader>dso',
            function () require'dap'.step_out() end,
            desc = "Dap: Terminate",
        },
        {
            '<leader>dsi',
            function () require'dap'.step_into() end,
            desc = "Dap: Terminate",
        },
        {
            '<leader>dss',
            function () require'dap'.step_over() end,
            desc = "Dap: Terminate",
        },
        {
            '<leader>dr',
            function () require'dap'.repl.open() end,
            desc = "Dap: Terminate",
        },
        {
            '<leader>dl',
            function () require'dap'.repl.run_last() end,
            desc = "Dap: Terminate",
        },
        {
            '<leader>dk',
            function () require'dap'.repl.hover() end,
            desc = "Dap: Terminate",
        },
    },
}
