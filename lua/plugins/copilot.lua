return {
    "github/copilot.vim",

    lazy = false,

    keys = {
        { "<C-k>", mode = "i", "<Plug>(copilot-suggest)", { desc = "Copilot: Suggest" } },
    },

    config = function()
        vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<M-j>', '<Plug>(copilot-next)', { desc = "Copilot: Next" })
        vim.api.nvim_set_keymap('i', '<M-k>', '<Plug>(copilot-previous)', { desc = "Copilot: Previous" })
    end
}
