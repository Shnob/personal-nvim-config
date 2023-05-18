local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Tele: find files"})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {desc = "Tele: git files"})
vim.keymap.set('n', '<C-c>', builtin.find_files, {desc = "Tele: find files"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search= vim.fn.input("grep > ") });

end, {desc = "Tele: grep >"})
