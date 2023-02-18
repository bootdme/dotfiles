-- https://github.com/nvim-lualine/lualine.nvim
return function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
		},
	})
end
