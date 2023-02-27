-- https://github.com/neovim/nvim-lspconfig
return function()
	local u = require("core.func")

	local lspconfig = require("lspconfig")
	local lsp = vim.lsp

	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	local eslint_disabled_buffers = {}

	local border_opts = { border = "single", focusable = false, scope = "line" }
	vim.diagnostic.config({ virtual_text = false, float = border_opts })

	lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
	lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

	-- track buffers that eslint can't format to use prettier instead
	lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
		local client = lsp.get_client_by_id(ctx.client_id)
		if not (client and client.name == "eslint") then
			goto done
		end

		for _, diagnostic in ipairs(result.diagnostics) do
			if diagnostic.message:find("The file does not match your project config") then
				local bufnr = vim.uri_to_bufnr(result.uri)
				eslint_disabled_buffers[bufnr] = true
			end
		end

		::done::
		return lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, config)
	end

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local lsp_formatting = function(bufnr)
		local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
		lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				if client.name == "solargraph" then
					return true
				end

				if client.name == "eslint" then
					return not eslint_disabled_buffers[bufnr]
				end

				if client.name == "null-ls" then
					return not u.table.some(clients, function(_, other_client)
						return other_client.name == "eslint" and not eslint_disabled_buffers[bufnr]
					end)
				end
			end,
		})
	end

	local on_attach =
		function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				local formatting_cb = function()
					lsp_formatting(bufnr)
				end

				u.buf_command(bufnr, "LspFormatting", formatting_cb)
				u.buf_map(bufnr, "x", "<CR>", formatting_cb)

				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					command = "LspFormatting",
				})
			end
		end,
		-- Mason Config
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

	-- Install LSP's via Mason
	-- https://github.com/williamboman/mason-lspconfig.nvim
	mason_lspconfig.setup({
		ensure_installed = require("core.global").lsp,
		automatic_installation = true,
	})

	local capabilities = lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		capabilities = capabilities,
	}

	-- Setup servers
	-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
	mason_lspconfig.setup_handlers({
		function(server)
			require("lspconfig")[server].setup({
				on_attach = on_attach,
                capabilities = capabilities,
			})
		end,

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

		eslint = function()
			local _opts = require("completion.servers.eslint")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			lspconfig.eslint.setup(final_opts)
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
