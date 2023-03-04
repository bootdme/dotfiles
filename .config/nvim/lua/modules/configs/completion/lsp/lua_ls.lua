local global = require('core.global')

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local library_files = vim.api.nvim_get_runtime_file('', true)

-- Add local nvim config to enable goto definitions, etc
table.insert(library_files, global.vim_path .. '/lua')

local root_files = {
    '.luarc.json',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
}

local settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
            path = runtime_path,
        },
        completion = {
            enable = true,
            callSnippet = 'Both',
            keywordSnippet = 'Both',
        },
        diagnostics = {
            enable = true,
            globals = {
                'vim',
                'use',
                'describe',
                'it',
                'assert',
                'before_each',
                'after_each',
            },
            disable = { 'different-requires', 'lowercase-global' },
            -- neededFileStatus = { ["codestyle-check"] = "Any" },
        },
        workspace = {
            library = {
                library = library_files,
                checkThirdParty = false,
            },
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
        flags = {
            debounce_text_changes = 150,
        },
        single_file_support = true,
    })
end

return M
