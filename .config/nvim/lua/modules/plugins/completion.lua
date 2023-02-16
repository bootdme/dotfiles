local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.lspconfig"),
	dependencies = {
		{ "ray-x/lsp_signature.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = require("completion.mason-tool-installer"),
		},
		{
			"glepnir/lspsaga.nvim",
			config = require("completion.lspsaga"),
		},
		{
			"jose-elias-alvarez/null-ls.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = require("completion.null-ls"),
		},
	},
}

completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("completion.luasnip"),
		},
		{ "onsails/lspkind.nvim" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
        { "mtoohey31/cmp-fish" },
		{ "ray-x/cmp-treesitter" },
		{
			"windwp/nvim-autopairs",
			config = require("completion.autopairs"),
		},
	},
}

return completion
