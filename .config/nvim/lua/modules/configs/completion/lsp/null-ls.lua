local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
    -- Formatting
    b.formatting.cbfmt,
    b.formatting.markdownlint,
    b.formatting.shfmt,
    b.formatting.prettierd.with({
        extra_filetypes = { 'toml' },
        extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
    }),
    b.formatting.rustfmt,
    b.formatting.sql_formatter.with({
        extra_args = { '--language' },
    }),
    b.formatting.stylua,

    -- Diagnostics
    b.diagnostics.markdownlint.with({
        extra_args = { '--disable MD033' },
    }),
    b.diagnostics.sqlfluff.with({
        extra_args = { '--dialect', 'tsql' },
    }),
    b.diagnostics.shellcheck,
    b.diagnostics.selene,
}

local M = {}

M.setup = function(on_attach)
    null_ls.setup({
        debug = true,
        sources = sources,
        on_attach = on_attach,
    })
end

return M
