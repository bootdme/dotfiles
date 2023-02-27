-- https://github.com/jose-elias-alvarez/null-ls.nvim
return function()
	local null_ls = require("null-ls")
	local b = null_ls.builtins

    local with_root_file = function(...)
        local files = { ... }
        return function(utils)
            return utils.root_has_file(files)
        end
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
	})
end
