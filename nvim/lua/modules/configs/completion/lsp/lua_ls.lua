-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
local settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
        },
        diagnostics = {
            enable = true,
            globals = { 'vim' },
            disable = { 'different-requires', 'undefined-field' },
        },
        workspace = {
            library = {
                vim.fn.expand('$VIMRUNTIME/lua'),
                vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
        },
        hint = { enable = true, setType = true },
        format = { enable = false },
        telemetry = { enable = false },

        -- Do not override treesitter lua highlighting with lua_ls's highlighting
        semantic = { enable = false },
    },
}

local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').lua_ls.setup({
        settings = settings,
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
