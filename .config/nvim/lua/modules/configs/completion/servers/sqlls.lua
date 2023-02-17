-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/sqlls.lua
return {
	cmd = { "sql-language-server", "up", "--method", "stdio" },
	filetypes = { "sql", "mysql" },
}
