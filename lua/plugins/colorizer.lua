return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,

    config = function()
        require("colorizer").setup(
            {},
            { RRGGBBAA = true }
        )
    end,

    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerReloadAllBuffers", "ColorizerDetachFromBuffer" },

    keys = {
        { "<leader>c", "<cmd>ColorizerToggle<CR>", { noremap = true, silent = true } },
    },
}
