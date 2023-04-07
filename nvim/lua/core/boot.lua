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
