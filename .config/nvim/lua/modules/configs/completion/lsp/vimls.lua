-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/vimls.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').vimls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
