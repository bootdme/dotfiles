return function()
    local u = require('core.func')

    local lsp = vim.lsp

    -- For LSP debugging
    lsp.set_log_level(vim.log.levels.DEBUG)

    local eslint_disabled_buffers = {}

    -- Manage LSP diagnostics
    vim.diagnostic.config({
        underline = false,
        virtual_text = false,
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

    -- Track buffers that eslint can't format to use prettier instead
    lsp.handlers['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
        local client = lsp.get_client_by_id(ctx.client_id)
        if not (client and client.name == 'eslint') then
            goto done
        end

        for _, diagnostic in ipairs(result.diagnostics) do
            if diagnostic.message:find('The file does not match your project config') then
                local bufnr = vim.uri_to_bufnr(result.uri)
                eslint_disabled_buffers[bufnr] = true
            end
        end

        ::done::
        return lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, config)
    end

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local lsp_formatting = function(bufnr)
        local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
        lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
                if client.name == 'eslint' then
                    return not eslint_disabled_buffers[bufnr]
                end

                if client.name == 'null-ls' then
                    return not u.table.some(clients, function(_, other_client)
                        return other_client.name == 'eslint' and not eslint_disabled_buffers[bufnr]
                    end)
                end
            end,
        })
    end

    local on_attach = function(client, bufnr)
        -- Commands
        u.buf_command(bufnr, 'LspHover', vim.lsp.buf.hover)
        u.buf_command(bufnr, 'LspDiagPrev', vim.diagnostic.goto_prev)
        u.buf_command(bufnr, 'LspDiagNext', vim.diagnostic.goto_next)
        u.buf_command(bufnr, 'LspDiagLine', vim.diagnostic.open_float)
        u.buf_command(bufnr, 'LspDiagQuickfix', vim.diagnostic.setqflist)
        u.buf_command(bufnr, 'LspTypeDef', vim.lsp.buf.type_definition)
        u.buf_command(bufnr, 'LspAct', function()
            vim.lsp.buf.code_action()
        end)
        u.buf_command(bufnr, 'LspRename', function()
            vim.lsp.buf.rename()
        end)

        -- Telescope
        u.buf_command(bufnr, 'LspRef', 'Telescope lsp_references')
        u.buf_command(bufnr, 'LspSym', 'Telescope lsp_workspace_symbols')
        u.buf_command(bufnr, 'LspDef', 'Telescope lsp_definitions')

        -- Bindings
        u.buf_set(bufnr, 'n', 'gi', ':LspRename<CR>')
        u.buf_set(bufnr, 'n', 'K', ':LspHover<CR>')
        u.buf_set(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
        u.buf_set(bufnr, 'n', ']a', ':LspDiagNext<CR>')
        u.buf_set(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')

        u.buf_set(bufnr, 'n', 'gy', ':LspRef<CR>')
        u.buf_set(bufnr, 'n', 'gh', ':LspTypeDef<CR>')
        u.buf_set(bufnr, 'n', 'gd', ':LspDef<CR>')
        u.buf_set(bufnr, 'n', 'ga', ':LspAct<CR>')
        u.buf_set(bufnr, 'x', 'ga', function()
            vim.lsp.buf.code_action() -- range
        end)

        if client.supports_method('textDocument/formatting') then
            local formatting_cb = function()
                lsp_formatting(bufnr)
            end

            u.buf_command(bufnr, 'LspFormatting', formatting_cb)
            u.buf_set(bufnr, 'n', '<CR>', formatting_cb)

            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                command = 'LspFormatting',
            })
        end
    end

    -- Advertise to LSP servers that nvim-cmp supports LSP
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason = require('mason')
    mason.setup()

    for _, server in ipairs(require('core.global').lsp) do
        require('completion.lsp.' .. server).setup(on_attach, capabilities)
    end
end
