-- Variables
local opt = vim.opt
local global = require('core.global')

-- Disable menu loading
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1

-- Do not load native syntax completion
vim.g.loaded_syntax_completion = 1

-- Do not load spell files
vim.g.loaded_spellfile_plugin = 1

-- Whether to load netrw by default
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- Disable sql omni completion
vim.g.loaded_sql_completion = 1

-- Set this to 0 in order to disable native EditorConfig support
vim.g.editorconfig = 1

-- Disable remote plugins
vim.g.loaded_remote_plugins = 1

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

    termguicolors = true,

    clipboard = 'unnamedplus',

    scrolloff = 8,
    signcolumn = 'yes',
    colorcolumn = '80',

    updatetime = 100,
    lazyredraw = true,

    wrap = false,
}

for n, v in pairs(sets) do
    opt[n] = v
end
