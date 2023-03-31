-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua
local M = {}

local function get_binary_path(binary)
    local path = nil
    if vim.loop.os_uname().sysname == 'Darwin' or vim.loop.os_uname().sysname == 'Linux' then
        path = vim.fn.trim(vim.fn.system('which ' .. binary))
    elseif vim.loop.os_uname().sysname == 'Windows' then
        path = vim.fn.trim(vim.fn.system('where ' .. binary))
    end
    if vim.v.shell_error ~= 0 then
        path = nil
    end
    return path
end

local function get_binary_path_list(binaries)
    local path_list = {}
    for _, binary in ipairs(binaries) do
        local path = get_binary_path(binary)
        if path then
            table.insert(path_list, path)
        end
    end
    return table.concat(path_list, ',')
end

M.setup = function(on_attach, capabilities)
    require('lspconfig').clangd.setup({
        on_attach = on_attach,
        capabilities = vim.tbl_deep_extend('keep', { offsetEncoding = { 'utf-16', 'utf-8' } }, capabilities),
        single_file_support = true,
        cmd = {
            'clangd',
            '-j=12',
            '--enable-config',
            -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
            '--query-driver=' .. get_binary_path_list({ 'clang++', 'clang', 'gcc', 'g++' }),
            '--all-scopes-completion',
            '--background-index',
            '--clang-tidy',
            '--completion-parse=auto',
            '--completion-style=bundled',
            '--function-arg-placeholders',
            '--header-insertion-decorators',
            '--header-insertion=never',
            '--include-cleaner-stdlib',
            '--limit-references=3000',
            '--limit-results=350',
            '--pch-storage=memory',
        },
    })
end

return M
