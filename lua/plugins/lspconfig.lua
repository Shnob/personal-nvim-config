return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    workspace = {
                        library = {
                            [vim.fn.expand '~/code/factorio-modding/factorio-lsp-stuff'] = true,
                        },
                    },
                },
            },
        }
    end
}
