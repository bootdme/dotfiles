-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/eslint.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').eslint.setup({
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
        end,
        capabilities = capabilities,
        handlers = {
            -- this error shows up occasionally when formatting
            -- formatting actually works, so this will supress it
            ['window/showMessageRequest'] = function(_, result)
                if result.message:find('ENOENT') then
                    return vim.NIL
                end

                return vim.lsp.handlers['window/showMessageRequest'](nil, result)
            end,
        },
    })
end

return M
