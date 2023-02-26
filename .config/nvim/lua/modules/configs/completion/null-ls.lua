-- https://github.com/jose-elias-alvarez/null-ls.nvim
return function()
	local lsp = vim.lsp

	local eslint_disabled_buffers = {}

	local null_ls = require("null-ls")
	local b = null_ls.builtins

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local table = {
		some = function(tbl, cb)
			for k, v in pairs(tbl) do
				if cb(k, v) then
					return true
				end
			end
			return false
		end,
	}

	local lsp_formatting = function(bufnr)
		local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
		lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				if client.name == "eslint" then
					return not eslint_disabled_buffers[bufnr]
				end
				if client.name == "null-ls" then
					return not table.some(clients, function(_, other_client)
						return other_client.name == "eslint" and not eslint_disabled_buffers[bufnr]
					end)
				end
			end,
		})
	end

	local sources = {
		-- Formatting
		b.formatting.markdownlint,
		b.formatting.prettierd.with({
			extra_filetypes = { "toml" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		b.formatting.beautysh,
		b.formatting.rustfmt,
		b.formatting.sql_formatter.with({
			extra_args = { "--language" },
		}),
		b.formatting.stylua,

		-- Diagnostics
		b.diagnostics.markdownlint.with({
			extra_args = { "--disable MD033" },
		}),
		b.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "tsql" },
		}),
		b.diagnostics.selene.with({
			condition = function(utils)
				return utils.root_has_file({ "selene.toml" })
			end,
		}),
	}

	null_ls.setup({
		debug = true,
		update_in_insert = true,
		sources = sources,
		debounce = 150,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						lsp_formatting(bufnr)
					end,
				})
			end
		end,
	})
end
