-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bashls.lua
local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').bashls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd_env = {
            GLOB_PATTERN = '*@(.sh|.inc|.bash|.command|.zsh)',
        },
        filetypes = { 'bash', 'sh', 'zsh' },
    })
end

return M
