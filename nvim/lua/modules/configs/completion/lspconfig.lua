-- https://github.com/neovim/nvim-lspconfig
return function()
    local lsp = vim.lsp

    -- For LSP debugging
    lsp.set_log_level(vim.log.levels.DEBUG)

    -- Manage LSP diagnostics
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

    -- Close signature help
    lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
        border = 'shadow',
        close_events = { 'CursorMoved', 'BufHidden', 'InsertCharPre' },
    })

    -- Handle hover
    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = 'shadow',
    })

    local on_attach = function(client)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
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
