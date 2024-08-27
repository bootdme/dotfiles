-- https://github.com/nvimtools/none-ls.nvim
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
        -- Formatters
        builtins.formatting.stylua,
        builtins.formatting.shfmt,
    }

    null_ls.setup({
        sources = sources,
        on_attach = on_attach,
    })
end
