local ui = {}

ui['folke/tokyonight.nvim'] = {
    lazy = false,
    name = 'tokyonight',
}

ui['nvim-treesitter/nvim-treesitter'] = {
    lazy = true,
    version = false,
    build = ':TSUpdate',
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('ui.treesitter'),
    dependencies = {
        'NvChad/nvim-colorizer.lua',
        config = require('ui.colorizer'),
    },
}

ui['lewis6991/gitsigns.nvim'] = {
    lazy = true,
    event = 'BufReadPost',
    config = require('ui.gitsigns'),
}

ui['j-hui/fidget.nvim'] = {
    lazy = true,
    event = 'BufReadPost',
    config = require('ui.fidget'),
}

ui['andweeb/presence.nvim'] = {
    lazy = false,
    config = require('ui.presence'),
}

ui['lukas-reineke/indent-blankline.nvim'] = {
    lazy = true,
    event = 'BufReadPost',
    config = require('ui.indent-blankline'),
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
