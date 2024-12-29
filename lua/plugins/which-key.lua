return {
    "folke/which-key.nvim",
    lazy = true,
    cmd = { "WhichKey" },
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 1200
        require("which-key").setup {
        }
    end
}
