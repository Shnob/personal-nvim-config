local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset('recommended')

lsp.ensure_installed({
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

lspconfig.clangd.setup {
}
