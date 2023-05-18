vim.o.virtualedit = 'none'

vim.keymap.set("n", "<leader>v", function()
    if vim.o.virtualedit == 'none' then
        vim.o.virtualedit = 'all'
    else
        vim.o.virtualedit = 'none'
    end
end, {desc = "Toggle virtualedit"})

vim.keymap.set('v', '<C-v>', ':VBox<CR>', {desc = "Venn: draw"})
