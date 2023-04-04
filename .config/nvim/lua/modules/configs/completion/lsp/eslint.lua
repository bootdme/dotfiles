-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/eslint.lua
local M = {}

M.setup = function(on_attach, capabilities)
    local lspconfig = require('lspconfig')

    lspconfig['eslint'].setup({
        root_dir = lspconfig.util.root_pattern('.eslintrc', '.eslintrc.js', '.eslintrc.json'),
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            client.server_capabilities.documentFormattingProvider = true
        end,
        capabilities = capabilities,
        settings = {
            format = {
                enable = true,
            },
        },
        handlers = {
            -- this error shows up occasionally when formatting
            -- formatting actually works, so this will supress it
            ['window/showMessageRequest'] = function(_, result)
                if result.message:find('ENOENT') then
                    return vim.NIL
                end

                return vim.lsp.handlers['window/showMessageRequest'](nil, result)
            end,
            ['eslint/confirmESLintExecution'] = function(_, result)
                if not result then
                    return
                end
                return 4 -- approved
            end,
            ['eslint/noLibrary'] = function()
                vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
                return {}
            end,
            ['eslint/openDoc'] = function(_, result)
                if not result then
                    return
                end
                local sysname = vim.loop.os_uname().sysname
                if sysname:match('Windows') then
                    os.execute(string.format('start %q', result.url))
                elseif sysname:match('Linux') then
                    os.execute(string.format('xdg-open %q', result.url))
                else
                    os.execute(string.format('open %q', result.url))
                end
                return {}
            end,
            ['eslint/probeFailed'] = function()
                vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
                return {}
            end,
        },
    })
end

return M
