return {
    'sindrets/diffview.nvim',
    keys = {
        { "<leader>gd", ":DiffviewOpen ", desc = "Diffview: Open..." },
        { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
        { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: File History" },
    },
    opts = {
    },
}
