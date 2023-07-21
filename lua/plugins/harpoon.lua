return
{
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {

        { "<leader>ha", function () require("harpoon.mark").add_file() end,        { desc = "Harpoon: mark" } },
        { "<leader>hh", function () require("harpoon.ui").toggle_quick_menu() end, { desc = "Harpoon: menu" } },
        { "<leader>q",  function () require("harpoon.ui").nav_file(1) end,       { desc = "Harpoon: 1" } },
        { "<leader>w",  function () require("harpoon.ui").nav_file(2) end,       { desc = "Harpoon: 2" } },
        { "<leader>e",  function () require("harpoon.ui").nav_file(3) end,       { desc = "Harpoon: 3" } },
        { "<leader>r",  function () require("harpoon.ui").nav_file(4) end,       { desc = "Harpoon: 4" } },
        { "<leader>1",  function () require("harpoon.ui").nav_file(5) end,       { desc = "Harpoon: 5" } },
        { "<leader>2",  function () require("harpoon.ui").nav_file(6) end,       { desc = "Harpoon: 6" } },
        { "<leader>3",  function () require("harpoon.ui").nav_file(7) end,       { desc = "Harpoon: 7" } },
        { "<leader>4",  function () require("harpoon.ui").nav_file(8) end,       { desc = "Harpoon: 8" } },
    }
}
