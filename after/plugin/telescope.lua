local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Tele: find files"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "Tele: git files"})
vim.keymap.set('n', '<leader>fr', function()
	builtin.grep_string({ search= vim.fn.input("grep > ") });

end, {desc = "Tele: grep >"})
