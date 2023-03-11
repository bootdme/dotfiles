local null_ls = require('null-ls')
local b = null_ls.builtins

local formatting = b.formatting
local diagnostics = b.diagnostics

local sources = {
    -- Formatting
    formatting.cbfmt,
    formatting.markdownlint,
    formatting.shfmt,
    formatting.prettierd.with({
        extra_filetypes = { 'toml' },
        extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
    }),
    formatting.rustfmt,
    formatting.sql_formatter.with({
        extra_args = { '--language' },
    }),
    formatting.stylua,
    formatting.fish_indent,

    -- Diagnostics
    diagnostics.markdownlint.with({
        extra_args = { '--disable MD033' },
    }),
    diagnostics.sqlfluff.with({
        extra_args = { '--dialect', 'tsql' },
    }),
    diagnostics.shellcheck,
    diagnostics.selene.with({
        cwd = function()
            return vim.fs.dirname(
                vim.fs.find({ 'selene.toml' }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
            ) or vim.fs.normalize('~/.config/nvim/selene.toml')
        end,
    }),
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
