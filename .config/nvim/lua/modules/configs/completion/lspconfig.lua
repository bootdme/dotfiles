-- https://github.com/neovim/nvim-lspconfig
return function()
	local lspconfig = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	-- https://github.com/williamboman/mason.nvim
	mason.setup({
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
		ensure_installed = {
			"bashls",
			"emmet_ls",
			"jsonls",
			"lua_ls",
			"marksman",
			"sqlls",
			"vimls",
		},
		automatic_installation = true,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		on_attach = function()
			-- https://github.com/ray-x/lsp_signature.nvim
			require("lsp_signature").on_attach({
				bind = true,
				use_lspsaga = false,
				floating_window = true,
				fix_pos = true,
				hint_enable = true,
				hi_parameter = "Search",
			})
		end,
		capabilities = capabilities,
	}

	-- Setup servers
	mason_lspconfig.setup_handlers({
		bashls = function()
			local _opts = require("completion.servers.bashls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.bashls.setup(final_opts)
		end,

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
end
