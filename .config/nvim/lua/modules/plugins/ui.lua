local ui = {}

ui["folke/tokyonight.nvim"] = {
	lazy = false,
	name = "tokyonight",
	config = require("ui.tokyonight"),
}

ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}

ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.lualine"),
}

ui["mtdl9/vim-log-highlighting"] = {
	lazy = true,
	ft = { "text", "txt", "log" },
}

ui["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = require("ui.treesitter"),
}

ui["folke/which-key.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.which-key"),
}

return ui
