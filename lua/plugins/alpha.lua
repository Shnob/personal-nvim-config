return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require 'alpha.themes.dashboard'
        dashboard.section.header.val = {
            "██████| ██| ██| ██| ██| ██████| █████|  ",
            "██| ██| ██| ██| ██| ██| ██| ██| ██| ██| ",
            "██|     ██| ██| ███|██| ██| ██| ██| ██| ",
            "██████| ██████| ██████| ██| ██| █████|  ",
            "    ██| ██| ██| ██|███| ██| ██| ██| ██| ",
            "██| ██| ██| ██| ██| ██| ██| ██| ██| ██| ",
            "██████| ██| ██| ██| ██| ██████| █████|  ",
        }
        dashboard.section.buttons.val = {
            dashboard.button("n", "  New file", ":ene <CR>"),
            dashboard.button("e", "󱏒  Open netrw", ":Ex <CR>"),
            dashboard.button("f", "󰮗  Find file",
                function() require("telescope.builtin").find_files({ no_ignore = true, no_ignore_parent = true }) end),
            dashboard.button("j", "  Git files",
                function() require("telescope.builtin").git_files() end),
            dashboard.button("r", "󰔛  Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("q", "󰗼  Quit NVIM", ":qa<CR>"),
        }
        require 'alpha'.setup(dashboard.config)
    end,
}
