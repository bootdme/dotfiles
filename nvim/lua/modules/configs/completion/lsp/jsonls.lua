-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/jsonls.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').jsonls.setup({
        flags = { debounce_text_changes = 500 },
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
            },
        },
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
