-- https://github.com/lukas-reineke/indent-blankline
return function()
	require("indent_blankline").setup({
		filetype_exclude = {
			"", -- for all buffers without a file type
			"TelescopePrompt",
			"dashboard",
			"git",
			"gitcommit",
			"help",
			"json",
			"log",
			"markdown",
			"txt",
			"text",
			"vimwiki",
		},
		context_patterns = {
			"^if",
			"^table",
			"block",
			"class",
			"for",
			"function",
			"if_statement",
			"import",
			"list_literal",
			"method",
			"selector",
			"type",
			"var",
			"while",
		},
	})
end
