local ui = {}

ui["folke/tokyonight.nvim"] = {
    lazy = false,
	name = "tokyonight",
	config = require("ui.tokyonight"),
}

ui["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.treesitter"),
	dependencies = {

	},
}

return ui
