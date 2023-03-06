local M = {}
local api = vim.api

local get_map_options = function(custom_options)
    local options = { noremap = true, silent = true }

    if custom_options then
        options = vim.tbl_extend('force', options, custom_options)
    end

    return options
end

M.buf_set = function(bufnr, mode, target, source, opts)
    opts = opts or {}
    opts.buffer = bufnr

    M.set(mode, target, source, get_map_options(opts))
end

M.set = function(mode, target, source, opts)
    vim.keymap.set(mode, target, source, get_map_options(opts))
end

M.command = function(name, fn, opts)
    api.nvim_create_user_command(name, fn, opts or {})
end

M.buf_command = function(bufnr, name, fn, opts)
    api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

M.t = function(str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

M.table = {
    some = function(tbl, cb)
        for k, v in pairs(tbl) do
            if cb(k, v) then
                return true
            end
        end
        return false
    end,
}

return M
