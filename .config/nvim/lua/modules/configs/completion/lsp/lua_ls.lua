local global = require('core.global')

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local settings = {
    Lua = {
        runtime = {
            diagnostics = {
                enable = true,
                globals = { 'vim' },
            },
            version = 'LuaJIT',
            path = runtime_path,
        },
        completion = {
            enable = true,
            callSnippet = 'Both',
            keyboardSnippet = 'Both',
        },
        workspace = {
            library = {
                vim.api.nvim_get_runtime_file('', true),
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                [vim.fn.expand(global.vim_path .. '/lua')] = true,
                [vim.fn.expand(global.data_dir .. '/lazy/*')] = true,
            },
            checkThirdParty = false,
            maxPreload = 2000,
            preloadFileSize = 50000,
        },

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
