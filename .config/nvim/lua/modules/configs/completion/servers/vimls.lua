-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/vimls.lua
return {
	cmd = { "vim-language-server", "--stdio" },
	filetypes = { "vim" },
}
