return {
    'akinsho/toggleterm.nvim',

    keys = {
        {[[<C-\>]]},
    },

    config = function()
        local powershell_options = {
            shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
            shellcmdflag =
            "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
            shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
            shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
            shellquote = "",
            shellxquote = "",
        }

        for option, value in pairs(powershell_options) do
            vim.opt[option] = value
        end

        local toggleterm = require("toggleterm")
        toggleterm.setup({
            open_mapping = [[<C-\>]],
            start_in_insert = true,
            direction = "float",
            float_opts = {
                border = "double",
                width = math.ceil(vim.o.columns * 0.5),
                height = math.ceil(vim.o.columns * 0.15)
            },
        })
    end
}
