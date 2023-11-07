local ui = {}

ui['folke/tokyonight.nvim'] = {
    lazy = false,
    name = 'tokyonight',
}

ui['nvim-treesitter/nvim-treesitter'] = {
    lazy = true,
    version = false,
    build = function()
        if #vim.api.nvim_list_uis() ~= 0 then
            vim.api.nvim_command('TSUpdate')
        end
    end,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('ui.treesitter'),
    dependencies = {
        'NvChad/nvim-colorizer.lua',
        config = require('ui.colorizer'),
    },
}

ui['lewis6991/gitsigns.nvim'] = {
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('ui.gitsigns'),
}

ui['nvim-lualine/lualine.nvim'] = {
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    config = require('ui.lualine'),
}

ui['itchyny/vim-highlighturl'] = {
    lazy = true,
    event = 'BufReadPost',
    config = function()
        vim.g.highlighturl_guifg = '#8AB4F8'
    end,
}

return ui
