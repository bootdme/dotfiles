-- https://github.com/folke/which-key.nvim
return function()
	require("which-key").setup({
		plugins = {
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = true,
				g = true,
			},
		},
		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 1, 1, 1 },
			winblend = 0,
		},
	})

	require("which-key").register({
		["<leader>"] = {
			f = { "Find" },
			g = { "Git" },
			l = { "Lazy" },
			t = { "Trouble" },
		},
	})
end
