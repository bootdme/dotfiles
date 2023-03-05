local global = require('core.global')

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local library_files = vim.api.nvim_get_runtime_file('', true)

-- Add local nvim config to enable goto definitions, etc
table.insert(library_files, global.vim_path .. '/lua')

local function find_up(start, names)
    return vim.fs.find(names, { path = vim.fs.dirname(start), upward = true })[1]
end

local root_dir = function(fname)
    return vim.fs.dirname(find_up(fname, {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
    })) or find_up(fname, {
        'lua', -- A lua dir.
    }) or vim.fs.dirname(find_up(fname, {
        '.git',
    })) or os.getenv('HOME')
end

local settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
        },
        completion = {
            enable = true,
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
        },
        workspace = {
            library = library_files,
            checkThirdParty = false,
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
        root_dir = root_dir,
        flags = {
            debounce_text_changes = 150,
        },
        single_file_support = true,
    })
end

return M
