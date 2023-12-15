return
{
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require "ibl".setup {
            indent = { char = "▏" }, -- ┆ ▏
            -- for example, context is off by default, use this to turn it on

            -- show_current_context = true,
            --show_current_context_start = true,
            -- use_treesitter = false, -- true,
            -- show_trailing_blankline_indent = false,
        }
    end
}
