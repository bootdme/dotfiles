-- https://github.com/lukas-reineke/indent-blankline
return function()
	require("indent_blankline").setup({
		char = "│",
		filetype_exclude = {
			"help",
			"alpha",
			"dashboard",
			"log",
			"markdown",
			"json",
			"txt",
			"TelescopePrompt",
			"lazy",
			"",
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = false,
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
		space_char_blankline = " ",
	})
end
