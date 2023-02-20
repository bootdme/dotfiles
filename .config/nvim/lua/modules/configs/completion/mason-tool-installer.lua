-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
	require("mason-tool-installer").setup({
		ensure_installed = require("core.global").null_ls,
		auto_update = true,
		run_on_start = true,
	})
end
