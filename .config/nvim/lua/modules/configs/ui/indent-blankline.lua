-- https://github.com/lukas-reineke/indent-blankline
return function()
	require("indent_blankline").setup({
		char = "│",
		filetype_exclude = {
			"help",
			"checkhealth",
			"man",
			"lspinfo",
			"dashboard",
			"log",
			"markdown",
			"json",
			"txt",
			"TelescopePrompt",
			"lazy",
			"",
		},
		buftype_exclude = { "terminal", "telescope", "nofile", "quickfix", "prompt" },
		space_char_blankline = " ",
	})
end
