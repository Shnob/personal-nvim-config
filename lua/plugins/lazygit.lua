return {
    "kdheepak/lazygit.nvim",
    cmd = { 'LazyGit' },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        --Set_custom_powershell_options()
    end,
    keys = {
        { '<leader>gg', "<cmd>LazyGit<cr>" },
    }
}
