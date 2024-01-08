return function()
    local null_ls = require('null-ls')
    local builtins = null_ls.builtins

    local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
            filter = function(client)
                return client.name == 'null-ls'
            end,
            bufnr = bufnr,
        })
    end

    local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
    local on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end

    local sources = {
        builtins.formatting.stylua,
    }

    null_ls.setup({
        diagnostics_format = '[#{c}] #{m} (#{s})',
        sources = sources,
        on_attach = on_attach,
    })
end
