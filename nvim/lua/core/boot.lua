-- Variables
local global = require('core.global')

local data_dir = global.data_dir
local lazy_path = data_dir .. 'lazy/lazy.nvim'

local api = vim.api

-- Auto install lazy.nvim when needed
if not vim.loop.fs_stat(lazy_path) then
    api.nvim_command(
        '!git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git ' .. lazy_path
    )
end

vim.opt.rtp:prepend(vim.env.LAZY or lazy_path)

-- macOS clipboard
if vim.loop.os_uname().sysname == 'Darwin' then
    vim.g.clipboard = {
        name = 'macOS-clipboard',
        copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
        paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
        cache_enabled = true,
    }
end
