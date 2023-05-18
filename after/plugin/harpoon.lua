local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, {desc = "Harpoon: mark"})
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, {desc = "Harpoon: menu"})

vim.keymap.set("n", "<leader>q", function() ui.nav_file(1) end, {desc = "Harpoon: 1"})
vim.keymap.set("n", "<leader>w", function() ui.nav_file(2) end, {desc = "Harpoon: 2"})
vim.keymap.set("n", "<leader>e", function() ui.nav_file(3) end, {desc = "Harpoon: 3"})
vim.keymap.set("n", "<leader>r", function() ui.nav_file(4) end, {desc = "Harpoon: 4"})
vim.keymap.set("n", "<leader>1", function() ui.nav_file(5) end, {desc = "Harpoon: 5"})
vim.keymap.set("n", "<leader>2", function() ui.nav_file(6) end, {desc = "Harpoon: 6"})
vim.keymap.set("n", "<leader>3", function() ui.nav_file(7) end, {desc = "Harpoon: 7"})
vim.keymap.set("n", "<leader>4", function() ui.nav_file(8) end, {desc = "Harpoon: 8"})
