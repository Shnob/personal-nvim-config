require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    "folke/tokyonight.nvim",

    "nvim-treesitter/nvim-treesitter",

    "nvim-treesitter/playground",

    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",

    "mbbill/undotree",

    "tpope/vim-fugitive",

    "nvim-lualine/lualine.nvim",

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    "ThePrimeagen/vim-be-good",

    --"nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "stevearc/oil.nvim",

    "folke/todo-comments.nvim",

    "alec-gibson/nvim-tetris",

    "jbyuki/venn.nvim",

    "lukas-reineke/indent-blankline.nvim",

    "folke/which-key.nvim",

    "mfussenegger/nvim-jdtls",

    "Eandrju/cellular-automaton.nvim",

    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },

    "lervag/vimtex",

    --"windwp/nvim-autopairs", // I thought I'd like this plugin, turns out it gets in the way

    "goonzoid/vim-reprocessed",
})
