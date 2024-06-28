-- Enable <leader> key
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })

-- Load core files
require('core.boot')
require('core.clip')
require('core.dirs')
require('core.opts')
require('core.lazy')
require('core.auto')
require('core.sets')

-- Enable 'tokyonight' colorscheme
vim.api.nvim_command('colorscheme gruvbox')
