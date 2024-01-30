-- https://github.com/neovim/nvim-lspconfig
return function()
    local lsp = vim.lsp

    lsp.set_log_level('debug')

    vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        update_in_insert = true,
        virtual_lines = false,
        signs = true,
        float = {
            focusable = false,
            style = 'minimal',
            source = 'always',
            format = function(diagnostic)
                if diagnostic.code then
                    return string.format('[%s]\n%s', diagnostic.code, diagnostic.message)
                else
                    return diagnostic.message
                end
            end,
        },
    })

    -- Publish diagnostic
    lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = '←',
            spacing = 2,
            severity = { min = vim.diagnostic.severity.HINT },
        },
        signs = {
            priority = 30,
            severity = { min = vim.diagnostic.severity.HINT },
        },
        severity_sort = true,
        update_in_insert = false,
    })

    -- Close signature help
    lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
        border = 'shadow',
        close_events = { 'CursorMoved', 'BufHidden', 'InsertCharPre' },
    })

    -- Handle hover
    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = 'shadow',
    })

    local on_attach = function()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover)
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
end
