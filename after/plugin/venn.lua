
vim.keymap.set("n", "<leader>v", function()
    if vim.o.virtualedit == 'none' then
        vim.o.virtualedit = 'all'
    else
        vim.o.virtualedit = 'none'
    end
end)

vim.keymap.set('v', 'v', ':VBox<CR>')
