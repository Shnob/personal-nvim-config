return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require('oil').setup()
    end,
    keys = {
        { "<leader>fo", "<cmd>Oil<cr>", { desc = "Open Oil" } },
    }
}
