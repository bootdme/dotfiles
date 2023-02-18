-- https://github.com/lukas-reineke/indent-blankline
return function()
	require("indent_blankline").setup({
		char = "│",
		filetype_exclude = { "help", "alpha", "dashboard", "lazy" },
		show_trailing_blankline_indent = false,
		show_current_context = false,
	})
end
