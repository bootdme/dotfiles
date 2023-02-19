-- https://github.com/jose-elias-alvarez/null-ls.nvim
return function()
	local null_ls = require("null-ls")
	local b = null_ls.builtins
	local with_diagnostics_code = function(builtin)
		return builtin.with({
			diagnostics_format = "#{m} [#{c}]",
		})
	end
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local sources = {
		-- Formatting
		b.formatting.cbfmt,
		b.formatting.markdownlint,
		b.formatting.prettierd.with({
			extra_filetypes = { "toml" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		b.formatting.beautysh,
		b.formatting.fish_indent,
		b.formatting.shfmt,
		b.formatting.sql_formatter,
		b.formatting.stylua,

		-- Diagnostics
		b.diagnostics.eslint_d,
		with_diagnostics_code(b.diagnostics.shellcheck),
		b.diagnostics.markdownlint.with({
			extra_args = { "--disable MD033" },
		}),
		b.diagnostics.sqlfluff,
	}

	null_ls.setup({
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end
