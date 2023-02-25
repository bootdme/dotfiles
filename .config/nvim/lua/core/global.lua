local global = {}

-- https://github.com/CharlesChiuGit/nvimdots.lua/blob/main/lua/core/global.lua
function global:load_variables()
	local home = os.getenv("HOME")
	local path_sep = "/"

	self.vim_path = vim.fn.stdpath("config")

	self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	self.modules_dir = self.vim_path .. path_sep .. "modules"
	self.home = home
	self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

-- Treesitter variables
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
global["ts"] = {
	"bash",
	"css",
	"fish",
	"gitignore",
	"help",
	"html",
	"javascript",
	"jsonc",
	"lua",
	"markdown",
	"markdown_inline",
	"regex",
	"rust",
	"sql",
	"vim",
}

-- LSP variables
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
global["lsp"] = {
	"bashls",
	"emmet_ls",
	"jsonls",
	"lua_ls",
	"marksman",
	"sqlls",
	"vimls",
}

-- Formatter & Linter variables
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
global["null_ls"] = {
	-- Formatters
	"cbfmt",
	"markdownlint",
	"prettierd",
	"rustfmt",
	"beautysh",
	"sql-formatter",
	"stylua",

	-- Linters
	"eslint_d",
	"selene",
	"sqlfluff",
}

global:load_variables()

return global
