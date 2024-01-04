local completion = {}

completion['neovim/nvim-lspconfig'] = {
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('completion.lspconfig'),
    dependencies = {
        { 'b0o/schemastore.nvim' },
        { 
            'williamboman/mason.nvim',
              build = ':MasonUpdate'
        },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            config = require('completion.mason-tool-installer'),
        },
    },
}

completion["nvimtools/none-ls.nvim"] = {
    lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("completion.none-ls"),
	dependencies = {
        "nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
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
            config = require('completion.luasnip'),
        },
        { 'onsails/lspkind.nvim' },
        { 'lukas-reineke/cmp-under-comparator' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-buffer' },
        {
            'windwp/nvim-autopairs',
            config = require('completion.autopairs'),
        },
    },
}

return completion
