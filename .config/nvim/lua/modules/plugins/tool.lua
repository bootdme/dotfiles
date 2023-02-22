local tool = {}

tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}

tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	version = false,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons" },
	},
}

-- Rust
tool["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("tool.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}

return tool
