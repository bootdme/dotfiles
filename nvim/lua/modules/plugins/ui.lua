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

return ui
