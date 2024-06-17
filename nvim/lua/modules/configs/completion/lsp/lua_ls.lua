local settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
        },
        diagnostics = {
            globals = { 'vim' },
            disable = { 'different-requires', 'undefined-field' },
        },
        completion = {
            enable = true,
            callSnippet = 'Both',
            keyboardSnippet = 'Both',
        },
        workspace = {
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
            maxPreload = 2000,
            preloadFileSize = 50000,
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
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings,
    })
end

return M
