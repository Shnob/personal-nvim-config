return
{
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        settings = {
            save_on_toggle = true,
        }
    },

    keys = {
        { "<leader>ha", function() require('harpoon'):list():add() end,                                    { desc = "Harpoon: mark" } },
        { "<leader>hh", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, { desc = "Harpoon: menu" } },
        { "<leader>q",  function() require('harpoon'):list():select(1) end,                                { desc = "Harpoon: 1" } },
        { "<leader>w",  function() require('harpoon'):list():select(2) end,                                { desc = "Harpoon: 2" } },
        { "<leader>e",  function() require('harpoon'):list():select(3) end,                                { desc = "Harpoon: 3" } },
        { "<leader>r",  function() require('harpoon'):list():select(4) end,                                { desc = "Harpoon: 4" } },
        { "<leader>1",  function() require('harpoon'):list():select(5) end,                                { desc = "Harpoon: 5" } },
        { "<leader>2",  function() require('harpoon'):list():select(6) end,                                { desc = "Harpoon: 6" } },
        { "<leader>3",  function() require('harpoon'):list():select(7) end,                                { desc = "Harpoon: 7" } },
        { "<leader>4",  function() require('harpoon'):list():select(8) end,                                { desc = "Harpoon: 8" } },
    }
}
