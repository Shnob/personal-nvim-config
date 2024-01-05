return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,

    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerReloadAllBuffers", "ColorizerDetachFromBuffer" },

    keys = {
        { "<leader>c", "<cmd>ColorizerToggle<CR>", { noremap = true, silent = true } },
    },

    config = function()
        require("colorizer").setup()
    end,
}
