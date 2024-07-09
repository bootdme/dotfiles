-- https://github.com/neovim/nvim-lspconfig
return function()
    local lsp = vim.lsp

    vim.diagnostic.config({
        signs = true,
        underline = true,
        update_in_insert = false,
    })

    lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        underline = true,
        update_in_insert = false,
    })

    local on_attach = function()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', '[a', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']a', vim.diagnostic.goto_next)
    end

    -- Advertise to LSP servers that nvim-cmp supports LSP
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason = require('mason')
    mason.setup({ log_level = vim.log.levels.ERROR })

    for _, server in ipairs(require('core.global').lsp) do
        require('completion.lsp.' .. server).setup(on_attach, capabilities)
    end

    vim.api.nvim_command([[LspStart]])
end
