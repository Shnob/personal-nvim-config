--    
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
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
                    { 'mode', separator = { left = '', right = '' }, padding = 2 },
                },
                lualine_b = {
                    { 'branch', padding = { left = 1, right = 1 }, },
                },
                lualine_c = {
                    {
                        'filename',
                        symbols = {
                            modified = '󰲶',
                            readonly = '󰍁',
                        }
                    },
                    { 'diff', padding = { left = 0, right = 0 }, },
                },
                lualine_x = {
                    { 'filetype', padding = { left = 1, right = 1 }, },
                    {
                        'fileformat',
                        padding = { left = 0, right = 1 },
                    },
                },
                lualine_y = {
                    {
                        function()
                            local bufnr = vim.api.nvim_get_current_buf()
                            local clients = vim.lsp.buf_get_clients(bufnr)
                            for _, c in pairs(clients) do
                                if c.name ~= 'copilot' then
                                    return c.name
                                end
                            end
                            return ''
                        end,
                        padding = { left = 1, right = 1 },
                    },
                    {
                        'diagnostics',
                        padding = { left = 0, right = 1 },
                    },
                },
                lualine_z = {
                    { 'progress', padding = { left = 1, right = 0 }, },
                    { 'location', separator = { left = '', right = '' }, padding = { left = 0, right = 1 }, },
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
