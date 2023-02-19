-- Enable <leader> key
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
vim.api.nvim_set_keymap("x", " ", "", { noremap = true })

require("core.boot")
require("core.clip")
require("core.load")
require("core.dirs")
require("core.opts")
require("core.lazy")
require("core.auto")
require("core.sets")

vim.api.nvim_command("colorscheme tokyonight-night")
