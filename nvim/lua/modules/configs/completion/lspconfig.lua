-- https://github.com/neovim/nvim-lspconfig
return function()
    local u = require('core.func')
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

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

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

        -- Telescope
        u.buf_command(bufnr, 'LspRef', 'Telescope lsp_references')
        u.buf_command(bufnr, 'LspSym', 'Telescope lsp_workspace_symbols')
        u.buf_command(bufnr, 'LspDef', 'Telescope lsp_definitions')

        -- Bindings
        u.buf_set(bufnr, 'n', 'gd', ':LspDef<CR>')
        u.buf_set(bufnr, 'n', 'K', ':LspHover<CR>')
        u.buf_set(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
        u.buf_set(bufnr, 'n', ']a', ':LspDiagNext<CR>')
        u.buf_set(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')

        u.buf_set(bufnr, 'n', 'ga', ':LspAct<CR>')
        u.buf_set(bufnr, 'x', 'ga', function()
            vim.lsp.buf.code_action() -- range
        end)
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
