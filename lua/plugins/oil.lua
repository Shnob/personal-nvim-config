return {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
        require('oil').setup()
    end,
    keys = {
        { "<leader>fo", "<cmd>Oil<cr>", { desc = "Open Oil" } },
    }
}
