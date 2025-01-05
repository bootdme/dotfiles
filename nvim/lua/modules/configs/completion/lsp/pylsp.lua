-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pylsp
local M = {}
local settings = {
    pylsp = {
        plugins = {
            pycodestyle = {
                ignore = { 'E501', 'F401' },
            },
        },
    },
}

M.setup = function(on_attach, capabilities)
    require('lspconfig').pylsp.setup({
        settings = settings,
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
