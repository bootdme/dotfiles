local completion = {}

completion['neovim/nvim-lspconfig'] = {
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('completion.lspconfig'),
    dependencies = {
        { 'williamboman/mason.nvim' },
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            config = require('completion.mason-tool-installer'),
        },
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
        {
            'L3MON4D3/LuaSnip',
            dependencies = { 'rafamadriz/friendly-snippets' },
        },
        { 'onsails/lspkind.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' },
        {
            'windwp/nvim-autopairs',
            config = require('completion.autopairs'),
        },
    },
}

return completion
