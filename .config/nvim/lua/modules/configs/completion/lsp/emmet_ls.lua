-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/emmet_ls.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').emmet_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
