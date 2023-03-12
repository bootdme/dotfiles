-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/marksman.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').marksman.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
