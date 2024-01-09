-- https://github.com/neovim/nvim-lspconfig
return function()
    local lsp = vim.lsp

    -- For LSP debugging
    lsp.set_log_level('debug')

    -- Manage LSP diagnostics
    vim.diagnostic.config({
        underline = true,
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
        vim.keymap.set('n', 'gd', vim.lsp.buf.declaration)
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
