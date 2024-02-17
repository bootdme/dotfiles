-- Variables
local opt = vim.opt
local global = require('core.global')

-- Disable menu loading
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1

-- Disable remote plugins
vim.g.loaded_remote_plugins = 1

-- Do not load native syntax completion
vim.g.loaded_spellfile_plugin = 1

-- Ctrl + C fix in .sql files
vim.g.omni_sql_no_default_maps = 1
vim.g.loaded_sql_completion = 1

-- Do not load spell files
vim.g.loaded_spellfile_plugin = 1

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
