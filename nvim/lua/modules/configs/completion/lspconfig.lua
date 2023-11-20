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

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
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
      end,
    })

    -- local on_attach = function(client, bufnr)
    --     -- Commands
    --     u.buf_command(bufnr, 'LspHover', vim.lsp.buf.hover)
    --     u.buf_command(bufnr, 'LspDiagPrev', vim.diagnostic.goto_prev)
    --     u.buf_command(bufnr, 'LspDiagNext', vim.diagnostic.goto_next)
    --     u.buf_command(bufnr, 'LspDiagLine', vim.diagnostic.open_float)
    --     u.buf_command(bufnr, 'LspDiagQuickfix', vim.diagnostic.setqflist)
    --     u.buf_command(bufnr, 'LspTypeDef', vim.lsp.buf.type_definition)
    --     u.buf_command(bufnr, 'LspAct', function()
    --         vim.lsp.buf.code_action()
    --     end)

    --     -- Telescope
    --     u.buf_command(bufnr, 'LspRef', 'Telescope lsp_references')
    --     u.buf_command(bufnr, 'LspSym', 'Telescope lsp_workspace_symbols')
    --     u.buf_command(bufnr, 'LspDef', 'Telescope lsp_definitions')

    --     -- Bindings
    --     u.buf_set(bufnr, 'n', 'gd', ':LspDef<CR>')
    --     u.buf_set(bufnr, 'n', 'K', ':LspHover<CR>')
    --     u.buf_set(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
    --     u.buf_set(bufnr, 'n', ']a', ':LspDiagNext<CR>')
    --     u.buf_set(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')

    --     u.buf_set(bufnr, 'n', 'ga', ':LspAct<CR>')
    --     u.buf_set(bufnr, 'x', 'ga', function()
    --         vim.lsp.buf.code_action() -- range
    --     end)
    -- end

    -- Advertise to LSP servers that nvim-cmp supports LSP
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason = require('mason')
    mason.setup({ log_level = vim.log.levels.ERROR })

    for _, server in ipairs(require('core.global').lsp) do
        require('completion.lsp.' .. server).setup(on_attach, capabilities)
    end
end
