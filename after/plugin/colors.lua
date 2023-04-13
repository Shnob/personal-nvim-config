
function ColorEditor(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "#1a1b26"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#1a1b26"})
end

vim.cmd[[colorscheme tokyonight-night]]
ColorEditor()
