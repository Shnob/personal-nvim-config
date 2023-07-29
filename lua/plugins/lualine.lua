return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '', right = '' }, padding = 2 },
                },
                lualine_b = {
                    { 'branch', padding = { left = 2, right = 1 }, },
                    { 'diff',   padding = { left = 0, right = 1 }, },
                    'diagnostics',
                },
                lualine_c = { 'filename' },
                lualine_x = {
                    'filetype',
                    { 'fileformat', padding = { left = 1, right = 2 }, },
                },
                lualine_y = { 'filesize' },
                lualine_z = {
                    { 'progress', padding = { left = 2, right = 1 }, },
                    { 'location', separator = { left = '', right = '' }, padding = { left = 0, right = 2 }, },
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
