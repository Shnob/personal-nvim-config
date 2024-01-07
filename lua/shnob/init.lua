--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

vim.g.termguicolors = true

--require("shnob.remap")
require("shnob.powershell-options")
require("shnob.set")
require("shnob.lazy")
require("shnob.remap")

vim.cmd.colorscheme("tokyonight-moon")
