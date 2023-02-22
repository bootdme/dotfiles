-- https://github.com/neovim/nvim-lspconfig
return function()
	local lspconfig = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	require("lspconfig.ui.windows").default_options.border = "single"

	-- https://github.com/williamboman/mason.nvim
	mason.setup({
		ui = {
			border = "single",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	})

	-- https://github.com/williamboman/mason-lspconfig.nvim
	mason_lspconfig.setup({
		ensure_installed = require("core.global").lsp,
		automatic_installation = true,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		capabilities = capabilities,
	}

	-- Setup servers
	mason_lspconfig.setup_handlers({
		function(server)
			require("lspconfig")[server].setup({
				capabilities = capabilities,
			})
		end,

		bashls = function()
			local _opts = require("completion.servers.bashls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.bashls.setup(final_opts)
		end,

		efm = function() end,

		emmet_ls = function()
			local _opts = require("completion.servers.emmet_ls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.emmet_ls.setup(final_opts)
		end,

		jsonls = function()
			local _opts = require("completion.servers.jsonls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.jsonls.setup(final_opts)
		end,

		lua_ls = function()
			local _opts = require("completion.servers.lua_ls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.lua_ls.setup(final_opts)
		end,

		marksman = function()
			local _opts = require("completion.servers.marksman")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.marksman.setup(final_opts)
		end,

		sqlls = function()
			local _opts = require("completion.servers.sqlls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.sqlls.setup(final_opts)
		end,

		vimls = function()
			local _opts = require("completion.servers.vimls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.vimls.setup(final_opts)
		end,
	})

	local efmls = require("efmls-configs")

	efmls.init({
		capabilities = capabilities,
		init_options = { documentFormatting = true, codeAction = true },
	})

	-- Formatters
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local stylua = require("efmls-configs.formatters.stylua")
	-- TODO: SQL

	-- Linters
	local eslint = require("efmls-configs.linters.eslint")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local vint = require("efmls-configs.linters.vint")

	efmls.setup({
		vim = { formatter = vint },
		lua = { formatter = stylua },
		javascript = { formatter = prettier_d, linter = eslint },
		json = { formatter = prettier_d, linter = eslint },
		javascriptreact = { formatter = prettier_d, linter = eslint },
		html = { formatter = prettier_d },
		css = { formatter = prettier_d },
		sh = { formatter = shfmt, linter = shellcheck },
		markdown = { formatter = prettier_d },
	})
end
