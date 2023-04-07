-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/sqlls.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').sqlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
