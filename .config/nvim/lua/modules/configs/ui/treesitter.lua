-- https://github.com/nvim-treesitter/nvim-treesitter
return function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"css",
			"fish",
			"gitignore",
			"help",
			"html",
			"javascript",
			"jsonc",
			"lua",
			"markdown",
			"markdown_inline",
			"regex",
			"sql",
			"vim",
		},

		-- Install parsers asynchronously
		sync_install = true,

		highlight = {
			enable = true,
		},

		-- Disable tressitter indentation
		indent = { enable = false },
	})

	require("nvim-treesitter.install").prefer_git = true
end
