-- https://github.com/jose-elias-alvarez/null-ls.nvim
return function()
	local null_ls = require("null-ls")
	local b = null_ls.builtins
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local sources = {
		-- Formatting
		b.formatting.cbfmt.with({
			extra_args = { "--config" },
		}),
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
		b.diagnostics.eslint_d,
		b.diagnostics.markdownlint.with({
			extra_args = { "--disable MD033" },
		}),
		b.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "tsql" },
		}),
		b.diagnostics.selene,
		b.diagnostics.shellcheck.with({
			diagnostics_format = "[#{c}] #{m} (#{s})",
			extra_args = { "-o", "all" },
		}),
	}

	null_ls.setup({
		debug = true,
		update_in_insert = true,
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end
