--    
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local lualine = require('lualine')

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
            bg       = 'NONE',
            fg       = '#bbc2cf',
            yellow   = '#ECBE7B',
            cyan     = '#008080',
            darkblue = '#081633',
            green    = '#98be65',
            orange   = '#FF8800',
            violet   = '#a9a1e1',
            magenta  = '#c678dd',
            blue     = '#51afef',
            red      = '#ff6a90',
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                globalstatus = true,
                component_separators = '',
                section_separators = '',
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            tabline = {
                lualine_c = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine
        local function ins_lualine(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in tabline
        local function ins_tabline(component)
            table.insert(config.tabline.lualine_c, component)
        end

        -- Inserts a component in inactive lualine
        local function ins_inactive(component)
            table.insert(config.inactive_sections.lualine_c, component)
        end

        local color_func = function()
            -- auto change color according to neovims mode
            local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red,
            }
            return { fg = mode_color[vim.fn.mode()] }
        end

        ins_lualine {
            function()
                return '▊'
            end,
            color = color_func,                -- Sets highlighting of component
            padding = { left = 0, right = 0 }, -- We don't need space before this
        }

        ins_lualine {
            'filename',
            symbols = {
                modified = '󰲶',
                readonly = '󰍁',
            },
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        ins_lualine {
            'filetype',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.fg, gui = 'bold' },
        }

        ins_lualine {
            -- filesize component
            'filesize',
            color = { fg = colors.green },
            cond = conditions.buffer_not_empty,
        }

        ins_lualine { 'location' }

        ins_lualine { 'progress', color = { fg = colors.fg } }

        ins_lualine {
            -- Lsp server name .
            function()
                local no_lsp_msg = '-'
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return no_lsp_msg
                end
                for _, client in ipairs(clients) do
                    if client.name == 'GitHub Copilot' then
                        goto continue
                    end
                    if vim.lsp.buf_is_attached(0, client.id) then
                        return client.name
                    end
                    ::continue::
                end
                return no_lsp_msg
            end,
            icon = '󰒓',
            color = { fg = '#ffffff', gui = 'bold' },
        }

        ins_lualine {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        }

        --- TABLINE ---

        ins_tabline {
            function()
                return '▊'
            end,
            color = color_func,                -- Sets highlighting of component
            padding = { left = 0, right = 0 }, -- We don't need space before this
        }

        ins_tabline {
            -- print working directory
            function()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
            end,
            color = { fg = colors.fg },
        }

        ins_tabline {
            'branch',
            icon = '󰘬',
            color = { fg = colors.violet, gui = 'bold' },
        }

        ins_tabline {
            'diff',
            -- Is it me or the symbol for modified us really weird
            symbols = { added = '+', modified = '~', removed = '-' },
            diff_color = {
                added = { fg = colors.lime },
                modified = { fg = colors.blue },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        --- INACTIVE ---

        ins_inactive {
            'filename',
            symbols = {
                modified = '󰲶',
                readonly = '󰍁',
            },
            cond = conditions.buffer_not_empty,
            color = { fg = colors.cyan },
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end
}
