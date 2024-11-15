local completion = {}

completion['neovim/nvim-lspconfig'] = {
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('completion.lspconfig'),
    dependencies = {
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            config = require('completion.mason-tool-installer'),
        },
        { 'williamboman/mason.nvim' },
    },
}

completion['nvimtools/none-ls.nvim'] = {
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('completion.none-ls'),
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
}

completion['hrsh7th/nvim-cmp'] = {
    lazy = true,
    event = 'InsertEnter',
    config = require('completion.cmp'),
    dependencies = {
        { 'onsails/lspkind.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' },
    },
}

return completion
