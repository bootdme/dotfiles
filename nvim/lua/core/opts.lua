-- Variables
local opt = vim.opt
local global = require('core.global')

local sets = {
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    number = true,
    relativenumber = true,

    swapfile = false,
    undodir = global.cache_dir .. 'undo/',
    undofile = true,
    history = 1000,

    grepformat = '%f:%l:%c:%m',
    grepprg = 'rg --hidden --vimgrep --smart-case --',

    termguicolors = true,

    clipboard = 'unnamedplus',

    scrolloff = 8,
    signcolumn = 'yes',
    colorcolumn = '80',

    shadafile = '',

    shell = '/bin/bash',

    updatetime = 100,
    lazyredraw = true,

    wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**',
    wildignorecase = true,

    wrap = false,
}

for n, v in pairs(sets) do
    opt[n] = v
end
