local null_ls = require('null-ls')
local b = null_ls.builtins

local formatting = b.formatting
local diagnostics = b.diagnostics

local sources = {
    -- Formatting
    formatting.cbfmt,
    formatting.prettierd.with({
        extra_filetypes = { 'toml' },
        disabled_filetypes = { 'md', 'markdown' },
        extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
    }),
    formatting.markdownlint,
    formatting.shfmt,
    formatting.rustfmt,
    formatting.clang_format,
    formatting.sql_formatter.with({
        extra_args = { '--language', 'tsql' },
    }),
    formatting.stylua,
    formatting.fish_indent,

    -- Diagnostics
    diagnostics.cpplint,
    diagnostics.markdownlint.with({
        extra_args = { '-r', '~MD013,~MD036,~MD025' },
    }),
    diagnostics.sqlfluff.with({
        extra_args = { '--dialect', 'tsql' },
    }),
    diagnostics.shellcheck,
    diagnostics.selene.with({
        cwd = function()
            return vim.fs.dirname(vim.fs.find({ 'selene.toml' }, { upward = true })[1])
                or vim.fs.normalize('~/.config/nvim/selene.toml')
        end,
    }),
    diagnostics.eslint_d,
    diagnostics.fish,
}

local M = {}

M.setup = function(on_attach)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach,
    })
end

return M
