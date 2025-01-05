-- https://github.com/neovim/nvim-lspconfig
return function()
    local lsp = vim.lsp

    vim.diagnostic.config({
        virtual_text = true,
    })

    local on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, {})
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, {})

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})

        vim.keymap.set('n', '[a', vim.diagnostic.goto_prev, {})
        vim.keymap.set('n', ']a', vim.diagnostic.goto_next, {})
    end

    -- Advertise to LSP servers that nvim-cmp supports LSP
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { 'documentation', 'detail', 'additionalTextEdits' },
    }

    local mason = require('mason')
    mason.setup({ log_level = vim.log.levels.ERROR })

    for _, server in ipairs(require('core.global').lsp) do
        require('completion.lsp.' .. server).setup(on_attach, capabilities)
    end

    vim.api.nvim_command([[LspStart]])
end
