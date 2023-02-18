local tool = {}

tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	version = false,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "LinArcX/telescope-env.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope-frecency.nvim",
			dependencies = {
				{ "kkharji/sqlite.lua" },
			},
		},
		{ "nvim-tree/nvim-web-devicons" },
	},
}

return tool
