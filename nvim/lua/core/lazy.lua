-- Variables
-- https://github.com/CharlesChiuGit/nvimdots.lua/blob/main/lua/core/pack.lua
local fn = vim.fn
local global = require('core.global')

local vim_path = global.vim_path
local data_dir = global.data_dir

local lazy_path = data_dir .. 'lazy/lazy.nvim'
local modules_dir = vim_path .. '/lua/modules'

local lazy = {}

function lazy:load_plugins()
    self.modules = {}

    local get_plugins = function()
        local list = {}
        local plugins_list = vim.split(fn.glob(modules_dir .. '/plugins/*.lua'), '\n')

        if type(plugins_list) == 'table' then
            for _, f in ipairs(plugins_list) do
                list[#list + 1] = f:sub(#modules_dir - 6, -1)
            end
        end

        return list
    end

    package.path = package.path
        .. string.format(';%s;%s', modules_dir .. '/configs/?.lua', modules_dir .. '/configs/?/init.lua')

    local plugin_files = get_plugins()

    for _, m in ipairs(plugin_files) do
        local modules = require(m:sub(0, #m - 4))

        if type(modules) == 'table' then
            for name, conf in pairs(modules) do
                self.modules[#self.modules + 1] = vim.tbl_extend('force', { name }, conf)
            end
        end
    end
end

function lazy:load_lazy()
    self:load_plugins()

    local lazy_settings = {
        root = data_dir .. 'lazy',
        git = {
            timeout = 300,
            url_format = 'https://github.com/%s.git',
        },
        checker = { enabled = true },
        install = { missing = true },
        ui = {
            size = { width = 0.88, height = 0.8 },
            wrap = true,
            border = 'rounded',
        },
        performance = {
            cache = {
                enabled = true,
                path = vim.fn.stdpath('cache') .. '/lazy/cache',
                disable_events = { 'UIEnter', 'BufReadPre' },
                ttl = 3600 * 24 * 2,
            },
            reset_packpath = true,
            rtp = {
                disabled_plugins = {
                    'gzip',
                    'matchit',
                    'matchparen',
                    'DisableSqlOmni',
                    'netrwPlugin',
                    'rplugin',
                    'tarPlugin',
                    'tohtml',
                    'tutor',
                    'zipPlugin',
                },
                reset = true,
                paths = {},
            },
        },
    }

    if vim.loop.os_uname().sysname == 'Darwin' then
        lazy_settings.concurrency = 20
    end

    vim.opt.rtp:prepend(lazy_path)
    require('lazy').setup(self.modules, lazy_settings)
end

lazy:load_lazy()
