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

return ui
